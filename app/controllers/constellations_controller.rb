class ConstellationsController < ApplicationController

    def index
        constellations = Constellation.all
        # render json: constellations 
        render json: ConstellationSerializer.new(constellations).to_serialized_json
 
    end

    def show
        constellation = Constellation.find(params[:id])
        # render json: watchlists
        render json: ConstellationDetailsSerializer.new(constellation).to_serialized_json
 
    end

end
