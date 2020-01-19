class AddDescriptionToConstellations < ActiveRecord::Migration[6.0]
  def change
    add_column :constellations, :description, :string
  end
end
