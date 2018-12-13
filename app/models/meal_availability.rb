class MealAvailability < ApplicationRecord
  STATUS = %w[Unregistered Applied Invited Accepted Rejected]

  belongs_to :user

  validates :status, inclusion: { in: STATUS }
end
