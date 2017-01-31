class Cart < ApplicationRecord
  has_many :cart_games, dependent: :destroy
end
