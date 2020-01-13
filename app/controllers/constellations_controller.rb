class ConstellationsController < ApplicationController

    def index
        constellations = Constellation.all
        render json: constellations 
    end
end
