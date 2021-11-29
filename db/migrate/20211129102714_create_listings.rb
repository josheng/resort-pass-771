class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.text :details
      t.string :city_state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
