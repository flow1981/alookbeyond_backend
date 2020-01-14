class AddDisplayedToConstellations < ActiveRecord::Migration[6.0]
  def change
    add_column :constellations, :displayed, :boolean,  default: false
  end
end
