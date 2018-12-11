class MealAvailability < ApplicationRecord
  belongs_to :user
  belongs_to :meal_event
  belongs_to :city
end
