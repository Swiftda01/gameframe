class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :town_city
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
