class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :nanny

  def price
    hours * nanny.rate
  end


end
