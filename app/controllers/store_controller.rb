class StoreController < ApplicationController
  def index
    @games = Game.order("release_date DESC")
  end
end
