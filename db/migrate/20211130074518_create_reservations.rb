class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :adult_price
      t.integer :child_price
      t.string :type
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
