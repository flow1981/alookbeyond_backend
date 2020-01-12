# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

# unassigned_const = Constellation.create(name: "unassigned")
# calsphere_const = Constellation.create(name: "Calspheres")


# nooa6 = Satellite.create(name: "NOAA 6",  watchlist_id: watchlist.id)
# noaa6_tle = Tle.create(
#     satellite_id: nooa6.id,
#     sat_name: "NOAA 6", 
#     line1: "1 11416U 79057A   20009.54513310  .00000022  00000-0  24252-4 0  9997",
#     line2: "2 11416  98.6497   8.4074 0010515   9.8375 350.3013 14.33560503114017"
# )

# rapideye2 = Satellite.create(name: "RAPIDEYE 2", watchlist_id: watchlist.id)
# Tle.create(
#     satellite_id: rapideye2.id,
#     sat_name: "RAPIDEYE 2",              
#     line1: "1 33312U 08040A   20010.44750758 -.00000482  00000-0 -44752-4 0  9999",
#     line2: "2 33312  97.7189  78.5526 0013472 162.7734 197.3970 14.89553922614134"
# )

# iss = Satellite.create(name: "ISS (ZARYA)")
# Tle.create(
#     satellite_id: iss.id,
#     sat_name:"ISS (ZARYA)", 
#     line1: "1 25544U 98067A   20009.58914988 -.00000025  00000-0  76486-5 0  9997",
#     line2: "2 25544  51.6454  58.1754 0005256 115.3542  45.1089 15.49547809207273"
# )

# calsphere1 = Satellite.create(name: "CALSPHERE 1",  constellation_id: calsphere_const.id)
# Tle.create(
#     satellite_id: calsphere1.id,
#     sat_name: "CALSPHERE 1",    
#     line1:   "1 00900U 64063C   20009.16444188  .00000200  00000-0  20429-3 0  9997",
#     line2:   "2 00900  90.1487  25.8173 0027499 174.4105 274.5255 13.73317584748459"
# )

# calsphere2 = Satellite.create(name: "CALSPHERE 2",  constellation_id: calsphere_const.id)
# Tle.create(
#     satellite_id: calsphere2.id,    
#     sat_name: "CALSPHERE 2",      
#     line1:   "1 00902U 64063E   20011.89136845  .00000008  00000-0 -18513-5 0  9990",
#     line2:   "2 00902  90.1574  28.4323 0017602 198.5354 278.3979 13.52679056538782"
# )

# calsphere4A = Satellite.create(name: "CALSPHERE 4A", constellation_id: calsphere_const.id)
# Tle.create(
#     satellite_id: calsphere4A.id,   
#     sat_name: "CALSPHERE 4A",           
#     line1: "1 01520U 65065H   20011.90845142  .00000055  00000-0  89511-4 0  9995",
#     line2: "2 01520  90.0442 128.5413 0069003 245.4405 228.0825 13.35804817649168"
# )

url = "https://www.celestrak.com/NORAD/elements/active.txt"
url_radarCalibration = "https://www.celestrak.com/NORAD/elements/radar.txt"


TLEs = WebReader.parseTextToTleHashes(url_radarCalibration)
radar_calibration = Constellation.create(name: "RadarCalibration")

TLEs.each{|data|
    sat = Satellite.create(name: data[:name], constellation_id: radar_calibration.id)
    Tle.create(
        satellite_id: sat.id,   
            sat_name: data[:name],           
            line1: data[:TLE1],
            line2: data[:TLE2]
    )
}

puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
puts "created #{Tle.all.length} TLE"