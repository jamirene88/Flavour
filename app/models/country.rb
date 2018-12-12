class Country < ApplicationRecord
  has_many :cities

  validate :name, presence: true, blank: false
end
