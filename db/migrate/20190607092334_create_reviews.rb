class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :parent_id
      t.integer :nanny_id
      t.integer :stars
      t.text :comment

      t.timestamps
    end
  end
end
