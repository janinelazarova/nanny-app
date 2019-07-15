class AddLatitudeToNannies < ActiveRecord::Migration[5.2]
  def change
  	add_column :nannies, :latitude, :decimal, precision: 10, scale: 5
  end
end
