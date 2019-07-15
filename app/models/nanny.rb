class Nanny < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :parents, through: :bookings
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # geocoded_by :address
  # after_validation :geocode

  def parent_ids
    parents.map {|parent| parent.id}
    
  end

  # def calc_latitude
  # 	Geocoder.coordinates(address)[0]
  	
  # end

  # def calc_longitude
  # 	Geocoder.coordinates(address)[1]
  # end

end
