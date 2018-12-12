class Country < ApplicationRecord
  has_many :cities

  validates :name, presence: true, blank: false
end
