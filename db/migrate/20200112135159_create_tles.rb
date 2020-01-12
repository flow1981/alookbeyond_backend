class CreateTles < ActiveRecord::Migration[6.0]
  def change
    create_table :tles do |t|
      t.integer :satellite_id
      t.string :sat_name
      t.string :line1
      t.string :line2

      t.timestamps
    end
  end
end
