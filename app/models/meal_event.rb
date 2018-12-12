class MealEvent < ApplicationRecord
  belongs_to :interest
  belongs_to :restaurant

  has_many :meal_availabilities
  has_many :users, through: :meal_availabilities
end
