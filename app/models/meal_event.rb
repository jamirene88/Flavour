class MealEvent < ApplicationRecord
  belongs_to :interest
  belongs_to :restaurant
end
