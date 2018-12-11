class CreateMealEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_events do |t|
      t.references :interest, foreign_key: true
      t.date :reservation_date
      t.time :reservation_time
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
