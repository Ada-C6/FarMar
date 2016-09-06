require 'csv'
#require_relative 'vendor'

module FarMar
  class Market
    attr_reader :market_id, :name, :address, :city, :county, :state, :zip
    attr_accessor
    attr_writer

    def initialize(market_hash)
      @market_id = market_hash["market_id"]
      @name = market_hash["name"]
      @address = market_hash["address"]
      @city = market_hash["city"]
      @county = market_hash["county"]
      @state = market_hash["state"]
      @zip = market_hash["zip"]
    end

    def self.all
      markets = []
      CSV.read("./support/markets.csv").each do |line|
        market_hash = {}
        market_hash[:market_id] = line[0].to_i
        market_hash[:name] = line[1]
        market_hash[:address] = line[2]
        market_hash[:city] = line[3]
        market_hash[:county] = line[4]
        market_hash[:state] = line[5]
        market_hash[:zip] = line[6]
        markets << FarMar::Market.new(market_hash)
      end
      return markets
    end

  end
end
