require 'csv'

# lib/farmar_market/farmar_market.rb
module FarMar
  class Market

    attr_reader :market_csv, :market_id, :market_name, :market_street, :market_city, :market_county, :market_state, :market_zip

    def initialize(market_hash)
      @market_csv = CSV.read("../FarMar/support/markets.csv", "r")
    end

    def self.all
      market_csv_file = CSV.read("../FarMar/support/markets.csv", "r")
      market_array = []
      market_hash = {}

      market_csv_file.each do |market|
        market_hash[:id] = market[0].to_i
        market_hash[:name] = market[1]
        market_hash[:street] = market[2]
        market_hash[:city] = market[3]
        market_hash[:market_county] = market[4]
        market_hash[:state] = market[5]
        market_hash[:zip] = market[6]
        market_array.push(self.new(market_hash))
      end

      return market_array
    end
  end
end
