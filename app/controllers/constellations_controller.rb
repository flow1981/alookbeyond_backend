class ConstellationsController < ApplicationController

    def index
        constellations = Constellation.all
        # render json: constellations 
        render json: ConstellationSerializer.new(constellations).to_serialized_json
 
    end
end
