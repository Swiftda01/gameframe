class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      @game.save
      format.html { redirect_to @game, notice: 'Game was successfully created.' }
      format.json { render :show, status: :created, location: @game }
    end
  end

  def update
    respond_to do |format|
      @game.update(game_params)
      format.html { redirect_to @game, notice: 'Game was successfully updated.' }
      format.json { render :show, status: :ok, location: @game }
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end


    def game_params
      params.require(:game).permit(:title, :description, :image1, :image2, :image3, :image4, :release_date, :price, :players, :multiplayer_format, :coop)
    end
end
