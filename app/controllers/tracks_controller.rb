class TracksController < ApplicationController

    def index
        tracks =Track.all
        render json:  tracks
    end

    def update
        track = Track.create(satellite_id: params[:sat_id], watchlist_id: params[:watchlist_id])
    end



    def destroy
        track = Track.find(params[:id])
        track.destroy

    end

end