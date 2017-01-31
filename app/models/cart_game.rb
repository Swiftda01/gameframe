class CartGame < ApplicationRecord
  belongs_to :cart
  belongs_to :game
end
