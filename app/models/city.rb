class City < ApplicationRecord
  belongs_to :country
  has_many :user_cities
  has_many :users, through: :user_cities

  has_many :meal_availability_location
  has_many :meal_availabilities, through: :meal_availability_location
  validates :name, presence: true, blank: false
end
