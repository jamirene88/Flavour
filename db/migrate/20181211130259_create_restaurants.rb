class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.integer :avg_price
      t.string :website
      t.string :currency
      t.integer :zomato_restaurant_id

      t.timestamps
    end
  end
end
