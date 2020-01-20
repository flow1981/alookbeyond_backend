class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.integer :satellite_id
      t.string :watchlist_id

      t.timestamps
    end
  end
end
