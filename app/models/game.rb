class Game < ApplicationRecord
  has_many :cart_games
  has_many :orders, :through :cart_games
  has_many :users, :through :orders
  has_many :game_genres
  has_many :genres, through: :game_genres
  has_many :user_games
  has_many :users, through: :user_games

  validates :price, numericality: {greater_than_or_equal_to: 0.01}

end
