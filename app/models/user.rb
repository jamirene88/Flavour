class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS = %w[Female Male]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :gender, presence: true, blank: false,  inclusion: { in: GENDERS }
  mount_uploader :photo, PhotoUploader

  has_many :meal_availabilities
  has_many :meal_events, through: :meal_availabilities
end
