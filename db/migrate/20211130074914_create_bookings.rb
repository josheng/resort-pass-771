class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true
      t.date :booking_date
      t.integer :no_of_adult
      t.integer :no_of_child
      t.integer :total_price

      t.timestamps
    end
  end
end
