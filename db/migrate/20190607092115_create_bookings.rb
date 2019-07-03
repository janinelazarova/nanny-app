class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :parent_id
      t.integer :nanny_id
      t.integer :hours
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price

      t.timestamps
    end
  end
end
