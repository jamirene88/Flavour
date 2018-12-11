class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS = %w[Female Male]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :gender, presence: true, blank: false, inclusion: { in: GENDERS }
  validates :age, presence: true, :numericality => { :only_integer => true, greater_than: 18 }
  mount_uploader :photo, PhotoUploader

  # Meal
  has_many :meal_availabilities
  has_many :meal_events, through: :meal_availabilities
  # Interests
  has_many :user_interests
  has_many :interests, through: :user_interests
  # Dietary Preferences
  has_many :user_cuisines
  has_many :cuisines, through: :user_cuisines

  # Contacts
  has_many :user_contacts

  # Location
  has_one :city
  has_one :country, through: :city
end
