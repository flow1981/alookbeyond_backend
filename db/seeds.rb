User.destroy_all
Watchlist.destroy_all
Constellation.destroy_all
Satellite.destroy_all

puts "cleared database from previous records"

guest = User.create(username: 'guest', email: 'guest@gmail.com')
puts "created #{User.all.length} users"

def createResources(constellations)

    constellations.each{ |c|

        description = WebReader.getSummaryFromWikipedia(c[:wikipedia])
       
        constellation = Constellation.create(name: c[:name], category: c[:category], description: description,displayed: false)

        tles = WebReader.getTLEsFromCelestrak(c[:celestrak])

        tles.each{|data|
            sat = Satellite.create( name: data[:name],
                                    line1: data[:TLE1],
                                    line2: data[:TLE2],
                                    constellation_id: constellation.id)
        }


    }
end

# # all active satellites
# # url = "https://www.celestrak.com/NORAD/elements/active.txt"


GPS = {
    category:  'Navigation & Positioning',
    name:       'GPS',
    celestrak:  'gps-ops',
    wikipedia:  'Global_Positioning_System'
}
GLONASS = {
    category:   'Navigation & Positioning',
    name:       'GLONASS', 
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
    name:       'BeiDou',
    celestrak:  'beidou',
    wikipedia:  'BeiDou'
}
# SBAA = {
#     category:   'Navigation & Positioning',
#     name:       'Satellite-based augmentation systems (SBAS)',  
#     celestrak:  'sbas',
#     wikipedia:  'GNSS_augmentation#Satellite-based_augmentation_system'
# }


STARLINK = {
    category:   'Communication',
    name:       'Starlink',
    celestrak:  'starlink',
    wikipedia:  'Starlink_(satellite_constellation)'
}


IRIDIUM = {
    category:   'Communication',
    name:       'Iridium',
    celestrak:  'iridium',
    wikipedia:  'Iridium_satellite_constellation'
}

ORBCOM = {
    category:   'Communication',
    name:       'Orbcomm',
    celestrak:  'orbcomm',
    wikipedia:  'Iridium_satellite_constellation'
}

GLOBALSTAR = {
    category:   'Communication',
    name:       'Globalstar',
    celestrak:  'globalstar',
    wikipedia:  'Globalstar'
}

SPIRE = {
    category:   'Weather and Earth Resources',
    name:       'Spire',
    celestrak:  'spire',
    wikipedia:  'Spire_Global'
}

NOAA = {
    category:   'Weather and Earth Resources',
    name:       'noaa',
    celestrak:  'globalstar',
    wikipedia:  'Globalstar'
}

PLANET = {
    category:   'Weather and Earth Resources',
    name:       'Planet',
    celestrak:  'planet',
    wikipedia:  'Planet_Labs'
}

TDRSS = {
    category:   'Communication',
    name:       'tdrss',
    celestrak:  'tdrss',
    wikipedia:  'Tracking_and_Data_Relay_Satellite_System'
}


constellations = [GPS, GLONASS, GALILEO, BEIDOU, STARLINK, IRIDIUM, GLOBALSTAR, SPIRE, NOAA, PLANET, TDRSS]

createResources(constellations)


Watchlist.create(name: "View 1", displayed: false, user_id: User.all.first.id)
Watchlist.create(name: "View 2", displayed: false, user_id: User.all.first.id)
Watchlist.create(name: "View 3", displayed: false, user_id: User.all.first.id)
Watchlist.create(name: "View 4", displayed: false, user_id: User.all.first.id)

# # Communication
# constellations =['iridium','starlink','orbcomm','globalstar','raduga','satnog','molniya','gorizont','amateur']
# category = 'Communication'

# createResources(constellations, category)

# # Weather and Earth Resources
# constellations =['spire','planet','noaa','tdrss','argos','sarsat','weather','goes']
# category = 'Weather and Earth Resources'

# createResources(constellations, category)

puts "created #{Watchlist.all.length} watchlists"
puts "created #{Constellation.all.length} constellations"
puts "created #{Satellite.all.length} satellites"
