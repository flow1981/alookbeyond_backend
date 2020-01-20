class Track < ApplicationRecord
    belongs_to :satellite
    belongs_to :watchlist
end
