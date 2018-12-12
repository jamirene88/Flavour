class Interest < ApplicationRecord
  has_many :user_interests
  has_many :users, through: :user_interests

  validate :name, presence: true, blank: false
end
