# lib/market.rb
require 'csv'

class Market
attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market)
  end

  def self.all
    all_markets = []

    CSV.read('support/markets.csv').each do |line|
      market = {}
      market[:id] = line[0].to_i
      market[:name] = line[1]
      market[:address] = line[2]
      market[:city] = line[3]
      market[:state] = line[4]
      market[:zip] = line[5]

      all_markets << self.new(market)
    end

    return all_markets
  end

end
