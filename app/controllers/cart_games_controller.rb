class CartGamesController < ApplicationController
  include CurrentCart
  before_action :set_cart_game, only: [:destroy]
  before_action :set_cart, only: [:create]

  def show
  end

  def create
    game = Game.find(params[:game_id])
    @cart_game = @cart.add_item(game)
    @cart_game.save
    redirect_to @cart_game.cart
  end

  def destroy
    cart = @cart_game.cart
    @cart_game.destroy
    if cart.cart_games.empty?
      cart.destroy
      redirect_to root_path, notice: "Your cart is now empty"
    else
      redirect_to @cart_game.cart
    end
  end

  private

  def set_cart_game
    @cart_game = CartGame.find(params[:id])
  end
end
