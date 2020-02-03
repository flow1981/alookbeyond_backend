class SatelliteSerializer 

    def initialize(satellite_object)
        @satellite_object = satellite_object
    end
    
    def to_serialized_json
        @satellite_object.to_json(
        :only => [:name, :id, :constellation_id, :line1, :line2, :displayed],
        :include => {:constellation => { :only => [:name]}
                    }
        )
    end

end