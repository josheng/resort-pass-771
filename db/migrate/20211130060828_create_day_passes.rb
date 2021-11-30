class CreateDayPasses < ActiveRecord::Migration[6.1]
  def change
    create_table :day_passes do |t|
      t.string :name
      t.decimal :price
      t.string :daypass_type
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
