require 'json'
require 'open-uri'
require 'byebug'
class WebReader < ApplicationRecord

    def self.getTLEsFromCelestrak(search_term)

        url   = "https://www.celestrak.com/NORAD/elements/" + search_term + ".txt"

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

    def self.getSummaryFromWikipedia(article_name)

        url = 'https://en.wikipedia.org/api/rest_v1/page/summary/' + article_name
        webContent  = open(url).read
        result = JSON.parse(webContent)["extract"]
        return result
    end

end
