class AddColumnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :listed, :boolean
  end
end
