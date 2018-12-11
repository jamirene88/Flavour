class CreateMealAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_availabilities do |t|
      t.references :user, foreign_key: true
      t.references :meal_event, foreign_key: true
      t.references :city, foreign_key: true
      t.string :status
      t.boolean :plus_one
      t.date :date

      t.timestamps
    end
  end
end
