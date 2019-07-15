class AddLongitudeToNannies < ActiveRecord::Migration[5.2]
  def change
  	add_column :nannies, :longitude, :decimal, precision: 10, scale: 5
  end
end
