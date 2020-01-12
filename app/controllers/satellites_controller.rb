class SatellitesController < ApplicationController

    def index
        satellites = Satellite.all
        # render json: satellites
        render json: SatelliteSerializer.new(satellites).to_serialized_json
    end

end
