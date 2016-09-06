require 'csv'

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
        market_hash["market_id"] = line[0].to_i
        market_hash["name"] = line[1]
        market_hash["address"] = line[2]
        market_hash["city"] = line[3]
        market_hash["county"] = line[4]
        market_hash["state"] = line[5]
        market_hash["zip"] = line[6]
        markets << FarMar::Market.new(market_hash)
      end
      return markets
    end

    def self.find(input)
      markets = self.all
      markets.each do |var|
        if var.market_id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Market ID #{ @market_id } is named #{ @name } and is located at #{ @address }, #{ @city }, #{ @state } #{ @zip }, in #{ @county } county."
    end

    def vendors
      vendors = []
      # @vendors = FarMar::Vendor.all
      # @vendors.each do |var|
      #   if var.market_id == @market_id
      #     vendors << var
      #   end
      # end
      # return vendors
    end
  end
end
