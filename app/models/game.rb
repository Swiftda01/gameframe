class Game < ApplicationRecord
  has_many :cart_games

  before_destroy :check_if_referenced_by_cart

  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  private

  def check_if_referenced_by_cart
    unless cart_games.empty?
      errors.add(:base, "Unable to delete game as it is currently referenced by a cart")
      throw :abort
    end
  end
end
