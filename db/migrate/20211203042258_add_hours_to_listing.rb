class AddHoursToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :hours, :text
  end
end
