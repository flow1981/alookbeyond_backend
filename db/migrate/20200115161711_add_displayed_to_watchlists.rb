class AddDisplayedToWatchlists < ActiveRecord::Migration[6.0]
  def change
    add_column :watchlists, :displayed, :boolean
  end
end
