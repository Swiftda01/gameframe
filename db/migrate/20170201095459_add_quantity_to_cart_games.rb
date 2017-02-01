class AddQuantityToCartGames < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_games, :quantity, :integer, default: 1
  end
end
