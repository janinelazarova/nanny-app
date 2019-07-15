class AddEducationToNannies < ActiveRecord::Migration[5.2]
  def change
  	add_column :nannies, :education, :string
  end
end
