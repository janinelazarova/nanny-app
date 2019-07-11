class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :nanny

  def price
    hours * nanny.rate
  end

  def friendly_start_time
  		start_time.strftime("%H:%M:%S")
  end

  def friendly_end_time
  		end_time.strftime("%H:%M:%S")
  end


end
