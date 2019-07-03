class Parent < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :nannies, through: :bookings
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
