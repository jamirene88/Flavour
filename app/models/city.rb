class City < ApplicationRecord
  belongs_to :country

  validate :name, presence: true, blank: false
end
