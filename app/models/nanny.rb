class Nanny < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :parents, through: :bookings
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def parent_ids
    parents.map {|parent| parent.id}
    
  end
end
