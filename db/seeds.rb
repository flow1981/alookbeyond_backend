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

# url = "https://www.celestrak.com/NORAD/elements/active.txt"
url_radarCalibration = "https://www.celestrak.com/NORAD/elements/radar.txt"

TLEs_radar = WebReader.parseTextToTleHashes(url_radarCalibration)
radar_calibration = Constellation.create(name: "Radar Calibration")

TLEs_radar.each{|data|
    sat = Satellite.create(name: data[:name], constellation_id: radar_calibration.id)
    Tle.create(
        satellite_id: sat.id,   
            sat_name: data[:name],           
            line1: data[:TLE1],
            line2: data[:TLE2]
    )
}

url_noaa = "https://www.celestrak.com/NORAD/elements/noaa.txt"

TLEs_noaa = WebReader.parseTextToTleHashes(url_noaa)
radar_calibration = Constellation.create(name: "NOOA Weather Satellites")

TLEs_noaa.each{|data|
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