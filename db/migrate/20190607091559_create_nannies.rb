class CreateNannies < ActiveRecord::Migration[5.2]
  def change
    create_table :nannies do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :address
      t.string :ages
      t.string :specialization
      t.text :bio
      t.text :image_url
      t.integer :rate

      t.timestamps
    end
  end
end
