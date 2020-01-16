User.destroy_all
Watchlist.destroy_all
Constellation.destroy_all
Satellite.destroy_all
Tle.destroy_all

puts "cleared database from previous records"

guest = User.create(username: "guest", email: "guest@gmail.com")
puts "created #{User.all.length} users"

watchlist = Watchlist.create(name: "My WatchList", user_id: User.all.first.id)
puts "created #{Watchlist.all.length} watchlists"

# url = "https://www.celestrak.com/NORAD/elements/active.txt"

constellations =[
# Navigation
'gps-ops','glo-ops','galileo','beidou','sbas','nnss','musson',
# Communication
'iridium','starlink','orbcomm','globalstar','raduga','satnog','molniya','gorizont','amateur',
# Weather and Earth Resources
'spire','planet','noaa','tdrss','argos','sarsat','weather','goes'
# 'active'
]

watchlists = constellations

constellations.each{|c|

    url   = "https://www.celestrak.com/NORAD/elements/" + c + ".txt"
    constellation =Constellation.create(name: c, displayed: false)
    watchlist =Watchlist.create(name: c, displayed: false, user_id: User.all.first.id)
    tles = WebReader.parseTextToTleHashes(url)
    tles.each{|data|
        sat = Satellite.create(name: data[:name], constellation_id: constellation.id, watchlist_id: watchlist.id)
        Tle.create(
            satellite_id: sat.id,   
                sat_name: data[:name],           
                line1: data[:TLE1],
                line2: data[:TLE2]
        )
    }
}


# url_iss = "https://live.ariss.org/iss.txt"
# url_iss = "https://www.tle.info/data/TLELIST.TXT"

#     TLEiss = WebReader.parseTextToTleHashes(url_iss)
#     TLEiss.each{|data|
#         sat = Satellite.create(name: data[:name])
#         Tle.create(
#             satellite_id: sat.id,   
#                 sat_name: data[:name],           
#                 line1: data[:TLE1],
#                 line2: data[:TLE2]
#         )
#     }

puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
puts "created #{Tle.all.length} TLE"