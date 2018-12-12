class Restaurant < ApplicationRecord
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines
end
