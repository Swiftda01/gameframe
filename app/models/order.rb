class Order < ApplicationRecord
  has_many :cart_games, dependent: :destroy
  belongs_to :user

  validates :first_name, :last_name, :address_line1, :town_city, :county, :postcode, presence: true

  def add_items_from_cart(cart)
    cart.cart_games.each do |item|
      item.cart_id = nil
      cart_games << item
    end
  end
end
