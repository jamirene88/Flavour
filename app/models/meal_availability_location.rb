class MealAvailabilityLocation < ApplicationRecord
  belongs_to :meal_availability
  belongs_to :city
end
