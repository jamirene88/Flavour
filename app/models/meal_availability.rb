class MealAvailability < ApplicationRecord
  STATUS = %w[Applied Invited Accepted Rejected]

  belongs_to :user
  belongs_to :meal_event
  belongs_to :city

  validates :status, inclusion: { in: STATUS }
end
