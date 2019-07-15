class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :nanny

  def price
    hours * nanny.rate
  end

  def friendly_start_time
  		start_time.strftime("%I:%M %p")
  end

  def friendly_end_time
  		end_time.strftime("%I:%M %p")
  end


end
