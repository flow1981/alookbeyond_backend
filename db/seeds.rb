User.destroy_all
Watchlist.destroy_all
Constellation.destroy_all
Satellite.destroy_all

puts "cleared database from previous records"

guest = User.create(username: 'guest', email: 'guest@gmail.com')
puts "created #{User.all.length} users"

def createResources(constellations)

    constellations.each{ |c|
        puts c
        puts c.class
        constellation = Constellation.create(name: c[:name], category: c[:category], displayed: false)

        watchlist = Watchlist.create(name: c[:name], displayed: false, user_id: User.all.first.id)

        url   = "https://www.celestrak.com/NORAD/elements/" + c[:celestrak] + ".txt"
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


GPS = {
    category:  'Navigation & Positioning',
    name:       'Global Positioning System (GPS)',
    celestrak:  'gps-ops',
    wikipedia:  'Global_Positioning_System'
}
GLONASS = {
    category:   'Navigation & Positioning',
    name:       'GLObal NAvigation Satellite System (GLONASS)', 
    celestrak:  'glo-ops',
    wikipedia:  'GLONASS',
}
GALILEO = {
    category:   'Navigation & Positioning',
    name:       'Galileo',
    celestrak:  'galileo',
    wikipedia:  'Galileo_(satellite_navigation)'
}
BEIDOU = {
    category:   'Navigation & Positioning',
    name:       'BeiDou Navigation Satellite System (BDS)',
    celestrak:  'beidou',
    wikipedia:  'BeiDou'
}
SBAA = {
    category:   'Navigation & Positioning',
    name:       'Satellite-based augmentation systems (SBAS)',  
    celestrak:  'sbas',
    wikipedia:  'GNSS_augmentation#Satellite-based_augmentation_system'
}

constellations = [GPS, GLONASS, GALILEO, BEIDOU, SBAA]

createResources(constellations)

# # Communication
# constellations =['iridium','starlink','orbcomm','globalstar','raduga','satnog','molniya','gorizont','amateur']
# category = 'Communication'

# createResources(constellations, category)

# # Weather and Earth Resources
# constellations =['spire','planet','noaa','tdrss','argos','sarsat','weather','goes']
# category = 'Weather and Earth Resources'

# createResources(constellations, category)

puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
