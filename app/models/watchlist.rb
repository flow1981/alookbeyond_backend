class Watchlist < ApplicationRecord
    belongs_to :user
    has_many :tracks, dependent: :destroy
    has_many :satellites, through: :tracks


end
