# lib/market.rb
require 'csv'

class Market
attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market)
    @id = market[:id]
    @name = market[:name]
    @address = market[:address]
    @city = market[:city]
    @county = market[:county]
    @state = market[:state]
    @zip = market[:zip]
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

  def self.find(id)
    all.each do |market|
      if market.id == id
        return market
      end
    end
    # if id > 500, returns entire array....fix later
  end


  def vendor
    Vendor.by_market(@id)
  end
end
