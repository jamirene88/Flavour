class Cuisine < ApplicationRecord
  has_many :user_cuisines
  has_many :users, through: :user_cuisines

  has_many :restaurant_cuisines
  has_many :restaurants, through: :restaurant_cuisines

  validates :name, presence: true, blank: false
end
