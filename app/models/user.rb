class User < ApplicationRecord
    has_many :watchlists, dependent: :destroy
end
