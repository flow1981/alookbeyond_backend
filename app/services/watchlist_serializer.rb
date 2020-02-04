class WatchlistSerializer 

    def initialize(watchlist_object)
        @watchlist_object = watchlist_object
    end
    
    def to_serialized_json
        @watchlist_object.to_json(
            :only => [:name, :id],
            :include => {   :user => { :only => [:username]},
                            :satellites => { :only => [:name, :id, :constellation_id, :line1, :line2, :displayed]}
            }
    )
        
    # @satellite_object.to_json(
    #     :only => [:name, :id, :constellation_id, :line1, :line2, :displayed],
    #     :include => {:constellation => { :only => [:name]}
    #                 }
    #     )

    end

end