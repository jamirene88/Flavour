class RemoveCityAndMealEventFromMealAvailabilities < ActiveRecord::Migration[5.2]
  def change
    remove_column :meal_availabilities, :city_id
    remove_column :meal_availabilities, :meal_event_id
  end
end
