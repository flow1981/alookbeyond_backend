class Satellite < ApplicationRecord
    has_many :tracks
    has_many :watchlists, through: :tracks
    belongs_to :constellation

end
