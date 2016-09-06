require 'csv'

module FarMar
  class Market

    def initialize(market_hash)
      #
      # @id = market_hash[:id]
      # @name = market_hash[:name]
      # @address = market_hash[:address]
      # @city = market_hash[:city]
      # @state = market_hash[:state]
      # @zip = market_hash[:zip]

    end

    def self.all
      markets = [] #array to store all of the hashes with market info
      CSV.read("../FarMar/support/markets.csv").each do |line|
        market = {} #create a new hash for each market to store specific info

        market[:id] = line[0].to_i
        market[:name] = line[1]
        market[:address] = line[2]
        market[:city] = line[3]
        market[:state] = line[4]
        market[:zip] = line[5]

        markets << self.new(market) #creates a new instance with the hash info and puts it in the array to be returned
      end
      markets #returns this array
    end

  end
end
