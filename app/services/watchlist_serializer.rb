class WatchlistSerializer 

    def initialize(watchlist_object)
        @watchlist_object = watchlist_object
    end
    
    def to_serialized_json
        @watchlist_object.to_json(
        :only => [:name, :id],
        :include => {:user => { :only => [:username]},
                    :satellites => { :only => [:name],
                                     :include => {:tle => {:only =>[:line1,:line2]}}
                                    },
                    }
        )
    end

end