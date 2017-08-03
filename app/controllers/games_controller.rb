class GamesController < ApplicationController
  include Admin
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authorise_admin, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      render :edit
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :image1, :image2, :image3, :image4, :release_date, :price, :players, :multiplayer_format, :coop, :listed)
  end
end
