class AddUnitsSoldToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :units_sold, :integer
  end
end
