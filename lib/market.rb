require 'csv'

module FarMar
  class Market
    attr_reader :id, :name

    def initialize(market_hash)

      @id = market_hash[:id]
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]

    end

    def self.all
      markets = [] #array to store all of the hashes with market info
      CSV.read("../FarMar/support/markets.csv").each do |line|
        market = {id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]} #create a new hash for each market to store specific info

        markets << self.new(market) #creates a new instance with the hash info and puts it in the array to be returned
      end
      markets #returns this array
    end

    def self.find(id)
      self.all.each do |m|
        if m.id == id
          return m #returns the object whose id matches the argument
        end
      end
    end


  end
end
