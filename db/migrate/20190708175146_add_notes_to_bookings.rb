class AddNotesToBookings < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :notes, :text
  end
end
