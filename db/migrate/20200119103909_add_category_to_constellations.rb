class AddCategoryToConstellations < ActiveRecord::Migration[6.0]
  def change
    add_column :constellations, :category, :string
  end
end
