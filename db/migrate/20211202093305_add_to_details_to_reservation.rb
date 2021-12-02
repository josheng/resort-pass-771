class AddToDetailsToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :details, :text
  end
end
