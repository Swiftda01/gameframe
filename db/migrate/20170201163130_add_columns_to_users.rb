class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :address_line3, :string
    add_column :users, :town_city, :string
    add_column :users, :county, :string
    add_column :users, :postcode, :string
  end
end
