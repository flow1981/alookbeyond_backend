require 'json'
require 'open-uri'
require 'byebug'
class WebReader < ApplicationRecord

    def self.parseTextToTleHashes(url)
        webContent  = open(url)  {|f| 
            counter = 0
            arrayOfHashes = []
            array =  []
            keys =[:name, :TLE1, :TLE2]

            f.each_line {|line|
                array.push(line.strip)
                counter = counter +1
                if counter>2
                    hash = {keys[0] => array[0], keys[1] => array[1], keys[2] => array[2] }
                    arrayOfHashes.push(hash)
                    counter = 0
                    array =[]
                end   
            } 
            return arrayOfHashes
        }
    end

end

# web_content  = open('https://www.celestrak.com/NORAD/elements/orbcomm.txt') {|f| f.read }