class CartGamesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def show
  end

  def create
    game = Game.find(params[:game_id])
    @cart_game = @cart.add_item(game)
    @cart_game.save
    redirect_to @cart_game.cart
  end
end
