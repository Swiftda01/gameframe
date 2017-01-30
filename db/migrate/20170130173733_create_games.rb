class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.date :release_date
      t.decimal :price
      t.integer :players
      t.string :multiplayer_format
      t.boolean :coop

      t.timestamps
    end
  end
end
