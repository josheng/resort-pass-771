class AddHotelPartnerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hotel_partner, :boolean
  end
end
