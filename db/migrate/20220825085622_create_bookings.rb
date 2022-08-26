class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.boolean :status

      t.timestamps
    end
  end
end
