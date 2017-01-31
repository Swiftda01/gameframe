class CartGamesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_cart_game, only: [:show, :edit, :update, :destroy]

  def create
    game = Game.find(params[:game_id])
    @cart_game = @cart.cart_games.build(game: game)
    @cart_game.save
    respond_to do |format|
      format.html { redirect_to @cart_game.cart,
      notice: "Item was successfully added to your cart" }
      format.json { render :show, status: :created, location: @cart_game }
    end
  end

  private
  
  def set_cart_game
    @cart_game = CartGame.find(params[:id])
  end

  def cart_game_params
    params.require(:cart_game).permit(:game_id)
  end
end
