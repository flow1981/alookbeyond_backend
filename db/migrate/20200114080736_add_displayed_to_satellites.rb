class AddDisplayedToSatellites < ActiveRecord::Migration[6.0]
  def change
    add_column :satellites, :displayed, :boolean,  default: false
  end
end
