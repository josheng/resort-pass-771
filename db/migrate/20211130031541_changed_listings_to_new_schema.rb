class ChangedListingsToNewSchema < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :city_state
    add_column  :listings, :city, :string
    add_column  :listings, :state, :string
    add_column  :listings, :country, :string
  end
end
