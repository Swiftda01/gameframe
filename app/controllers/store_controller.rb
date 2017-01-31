class StoreController < ApplicationController
  def index
    @games = Game.all
  end
end
