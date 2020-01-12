class Satellite < ApplicationRecord
    belongs_to :watchlist, optional: true
    belongs_to :constellation, optional: true

    has_one :tle
end