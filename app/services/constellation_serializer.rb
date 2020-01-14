class ConstellationSerializer 

    def initialize(constellation_object)
        @constellation_object = constellation_object
    end
    
    def to_serialized_json
        @constellation_object.to_json(
        :only => [:name, :id],
        :include => {:satellites => {   :only =>[:name, :id, :constellation_id],
                                        :include => {:tle => { :only => [:line1, :line2]}}}}
        )
    end

end