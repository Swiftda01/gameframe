class CartGame < ApplicationRecord
  belongs_to :cart
  belongs_to :game, optional: true
  belongs_to :order, optional: true
end
