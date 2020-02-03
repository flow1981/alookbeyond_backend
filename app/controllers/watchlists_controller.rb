class WatchlistsController < ApplicationController

    def index
        watchlists = Watchlist.all
        # render json: watchlists
        # render json: WatchlistSerializer.new(watchlists).to_serialized_json
        render json: ConstellationSerializer.new(constellations).to_serialized_json
    end

    def show
        watchlist = Watchlist.find(params[:id])
        # render json: watchlists
        render json: WatchlistSerializer.new(watchlist).to_serialized_json
    end

    def update
        puts params["data"]["watchlist_id"]
        puts params["data"]["sat_ids"]
        id  = params["data"]["watchlist_id"]
        watchlist = Watchlist.find_by(id: params["data"]["watchlist_id"])

        current_trackings=Track.where(watchlist_id: watchlist.id)
        current_trackings.each do |track|
            track.destroy
        end

        satellites_ids = params["data"]["sat_ids"]

        satellites_ids.each do |sat_id|
            Track.create(satellite_id: sat_id, watchlist_id: watchlist.id)
         end

        Track.create(satellite_id: 3361, watchlist_id: 92)
        
        render json: WatchlistSerializer.new(watchlist).to_serialized_json
    end



end
