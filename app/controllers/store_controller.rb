class StoreController < ApplicationController
  def index
    results = Game.where("title = '#{params[:name_search]}'")
    if (results.count > 0)
      @games = results.order("release_date DESC")
    else
      @games = Game.order("release_date DESC")
    end
  end
end
