class CreateCartGames < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_games do |t|
      t.references :cart, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
