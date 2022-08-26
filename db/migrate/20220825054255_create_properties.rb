class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :address
      t.integer :lat
      t.integer :long
      t.integer :user_id

      t.timestamps
    end
  end
end
