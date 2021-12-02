class AddFacilityToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :facilities, :text
  end
end
