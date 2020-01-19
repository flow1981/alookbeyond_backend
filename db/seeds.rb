User.destroy_all
Watchlist.destroy_all
Constellation.destroy_all
Satellite.destroy_all

puts "cleared database from previous records"

guest = User.create(username: 'guest', email: 'guest@gmail.com')
puts "created #{User.all.length} users"

def createResources(constellations, category)
   
    constellations.each{|c|
        url   = "https://www.celestrak.com/NORAD/elements/" + c + ".txt"
        constellation = Constellation.create(name: c, category: category, displayed: false)
        watchlist = Watchlist.create(name: c, displayed: false, user_id: User.all.first.id)
        tles = WebReader.parseTextToTleHashes(url)
        tles.each{|data|
            sat = Satellite.create( name: data[:name],
                                    line1: data[:TLE1],
                                    line2: data[:TLE2],
                                    constellation_id: constellation.id,
                                    watchlist_id: watchlist.id)
        }
    }
end

# # all active satellites
# # url = "https://www.celestrak.com/NORAD/elements/active.txt"

# Navigation
constellations =['gps-ops','glo-ops','galileo','beidou','sbas','nnss','musson']
category = 'Navigation & Positioning'

createResources(constellations, category)

# Communication
constellations =['iridium','starlink','orbcomm','globalstar','raduga','satnog','molniya','gorizont','amateur']
category = 'Communication'

createResources(constellations, category)

# Weather and Earth Resources
constellations =['spire','planet','noaa','tdrss','argos','sarsat','weather','goes']
category = 'Weather and Earth Resources'

createResources(constellations, category)

puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
