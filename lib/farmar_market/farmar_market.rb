require 'csv'

# lib/farmar_market/farmar_market.rb
module FarMar
  class Market

    attr_reader :market_id, :market_name, :market_street, :market_city, :market_county, :market_state, :market_zip

    def initialize(market_hash)
      @market_id = market_hash[:market_id]
      @market_name = market_hash[:market_name]
      @market_street = market_hash[:market_street]
      @market_city = market_hash[:market_city]
      @market_county = market_hash[:market_county]
      @market_state = market_hash[:market_state]
      @market_zip = market_hash[:market_zip]
    end

    def self.all
      market_csv_file = CSV.read("../FarMar/support/markets.csv")
      market_array = []

      market_csv_file.each do |market|
        market_hash = {}
        market_hash[:market_id] = market[0].to_i
        market_hash[:market_name] = market[1].to_s
        market_hash[:market_street] = market[2].to_s
        market_hash[:market_city] = market[3].to_s
        market_hash[:market_county] = market[4].to_s
        market_hash[:market_state] = market[5].to_s
        market_hash[:market_zip] = market[6].to_i
        market_array << self.new(market_hash)
      end
      return market_array
    end

    def self.find(id)
      markets = self.all
      markets.each do |market|
        if market.market_id == id.to_i
          return market
        end
      end
      raise Exception("ID not present")
    end

    def vendors
      return FarMar::Vendor.by_market(@market_id)
    end
  end
end
