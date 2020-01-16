class WatchlistsController < ApplicationController

    def index
        watchlists = Watchlist.all
        # render json: watchlists
        render json: WatchlistSerializer.new(watchlists).to_serialized_json
    end

    def show
        # byebug
        watchlist = Watchlist.find(params[:id])
        # render json: watchlists
        render json: WatchlistSerializer.new(watchlist).to_serialized_json
    end

end
