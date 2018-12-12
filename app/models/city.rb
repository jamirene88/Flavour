class City < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, blank: false
end
