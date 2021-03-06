class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_that_cart_contains_items, only: [:new]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.add_items_from_cart(@cart)
    order.update(user_id: current_user.id)
    if order.save
      order.add_to_units_sold
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to order_summary_path(order), notice: "Your order has been placed - Thank you!"
    end
  end

  def summary
    @order = Order.find(params[:id])
  end

  private

  def ensure_that_cart_contains_items
    if @cart.cart_games.empty?
      redirect_to store_index_url, notice: "Your cart is empty"
    end
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address_line1, :address_line2, :address_line3, :town_city, :county, :postcode, :user_id)
  end
end
