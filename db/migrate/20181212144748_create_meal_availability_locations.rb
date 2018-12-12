class CreateMealAvailabilityLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_availability_locations do |t|
      t.references :meal_availability, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
