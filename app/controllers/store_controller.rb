class StoreController < ApplicationController
  def index
    @games = Game.where(listed: true).order("release_date DESC")

    if params[:name_search].present?
      results = @games.where("title = ?", params[:name_search])
      @games = results if results.count > 0
    end
  end
end
