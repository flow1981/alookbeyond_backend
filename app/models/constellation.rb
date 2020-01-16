class Constellation < ApplicationRecord
    has_many :satellites, dependent: :destroy
end
