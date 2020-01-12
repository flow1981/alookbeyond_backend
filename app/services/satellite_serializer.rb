class SatelliteSerializer 


    def initialize(satellite_object)
        @satellite_object = satellite_object
    end
    
    def to_serialized_json
        @satellite_object.to_json(
        :only => [:name],
        :include => {:tle => { :only => [:line1, :line2]},
                    :constellation => { :only => [:name]},
                    :watchlist => { :only => [:name]}
                    }
        )
    end

end