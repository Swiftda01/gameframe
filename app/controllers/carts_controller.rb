class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to store_index_url, notice: "Your cart is now empty"
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
