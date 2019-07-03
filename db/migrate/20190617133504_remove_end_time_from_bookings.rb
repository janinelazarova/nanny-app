class RemoveEndTimeFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :end_time, :datetime
  end
end
