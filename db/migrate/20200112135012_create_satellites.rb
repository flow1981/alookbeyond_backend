class CreateSatellites < ActiveRecord::Migration[6.0]
  def change
    create_table :satellites do |t|
      t.string :name
      t.string :int_designator
      t.string :norad_cat_name
      t.integer :watchlist_id
      t.integer :constellation_id
      t.string :line1
      t.string :line2
      t.timestamps
    end
  end
end
