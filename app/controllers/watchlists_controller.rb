class WatchlistsController < ApplicationController

    def index
        watchlists = Watchlist.all
        # render json: watchlists
        render json: WatchlistSerializer.new(watchlists).to_serialized_json
    end

end
