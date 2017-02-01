class AddOrderToCartGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :cart_games, :order, foreign_key: true
  end
end
