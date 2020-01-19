class ConstellationSerializer 

    def initialize(constellation_object)
        @constellation_object = constellation_object
    end
    
    def to_serialized_json
        @constellation_object.to_json(
        :only => [:name, :id, :category, :description, :displayed]
        )
    end

end