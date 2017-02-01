class Game < ApplicationRecord
  has_many :cart_games, dependent: :destroy

  validates :price, numericality: {greater_than_or_equal_to: 0.01}

end
