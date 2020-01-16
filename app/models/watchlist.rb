class Watchlist < ApplicationRecord
    belongs_to :user
    has_many :satellites, dependent: :destroy

end
