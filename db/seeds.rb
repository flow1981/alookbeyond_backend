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
'gps-ops','glo-ops','galileo','beidou','sbas','nnss','musson'
# 'active'
]

constellations.each{|c|

    url   = "https://www.celestrak.com/NORAD/elements/" + c + ".txt"
    constellation =Constellation.create(name: c, displayed: false)
    TLEs = WebReader.parseTextToTleHashes(url)
    TLEs.each{|data|
        sat = Satellite.create(name: data[:name], constellation_id: constellation.id)
        Tle.create(
            satellite_id: sat.id,   
                sat_name: data[:name],           
                line1: data[:TLE1],
                line2: data[:TLE2]
        )
    }
}


url_iss = "https://live.ariss.org/iss.txt"
url_iss = "https://www.tle.info/data/TLELIST.TXT"

    TLEiss = WebReader.parseTextToTleHashes(url_iss)
    TLEiss.each{|data|
        sat = Satellite.create(name: data[:name])
        Tle.create(
            satellite_id: sat.id,   
                sat_name: data[:name],           
                line1: data[:TLE1],
                line2: data[:TLE2]
        )
    }


# url_radar = "https://www.celestrak.com/NORAD/elements/radar.txt"
# radar_calibration = Constellation.create(name: "Radar Calibration", displayed: false)

# TLEs_radar = WebReader.parseTextToTleHashes(url_radar)
# TLEs_radar.each{|data|
#     sat = Satellite.create(name: data[:name], constellation_id: radar_calibration.id)
#     Tle.create(
#         satellite_id: sat.id,   
#             sat_name: data[:name],           
#             line1: data[:TLE1],
#             line2: data[:TLE2]
#     )
# }

# url_noaa = "https://www.celestrak.com/NORAD/elements/noaa.txt"
# nooa = Constellation.create(name: "NOOA Environment Satellites")

# TLEs_noaa = WebReader.parseTextToTleHashes(url_noaa)
# TLEs_noaa.each{|data|
#     sat = Satellite.create(name: data[:name], constellation_id: nooa.id)
#     Tle.create(
#         satellite_id: sat.id,   
#             sat_name: data[:name],           
#             line1: data[:TLE1],
#             line2: data[:TLE2]
#     )
# }

# url_weather = "https://www.celestrak.com/NORAD/elements/weather.txt"
# weather = Constellation.create(name: "Weather Satellites")

# TLEs_weather = WebReader.parseTextToTleHashes(url_weather)
# TLEs_weather.each{|data|
#     sat = Satellite.create(name: data[:name], constellation_id: weather.id)
#     Tle.create(
#         satellite_id: sat.id,   
#             sat_name: data[:name],           
#             line1: data[:TLE1],
#             line2: data[:TLE2]
#     )
# }


# url_gps = "https://www.celestrak.com/NORAD/elements/gps-ops.txt"
# gps = Constellation.create(name: "GPS")

# TLEs_gps = WebReader.parseTextToTleHashes(url_gps)
# TLEs_gps.each{|data|
#     sat = Satellite.create(name: data[:name], constellation_id: gps.id)
#     Tle.create(
#         satellite_id: sat.id,   
#             sat_name: data[:name],           
#             line1: data[:TLE1],
#             line2: data[:TLE2]
#     )
# }

# url_beidou = "https://www.celestrak.com/NORAD/elements/beidou.txt"
# beidou = Constellation.create(name: "Beidou")

# TLEs_beidou = WebReader.parseTextToTleHashes(url_beidou)
# TLEs_beidou.each{|data|
#     sat = Satellite.create(name: data[:name], constellation_id: beidou.id)
#     Tle.create(
#         satellite_id: sat.id,   
#             sat_name: data[:name],           
#             line1: data[:TLE1],
#             line2: data[:TLE2]
#     )
# }

puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
puts "created #{Tle.all.length} TLE"