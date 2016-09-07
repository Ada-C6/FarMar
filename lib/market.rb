require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :st_addy, :city, :county, :st, :zip

    def initialize(id, name, st_addy, city, county, st, zip)
      @id = id
      @name = name
      @st_addy = st_addy
      @city = city
      @county = county
      @st = st
      @zip = zip
    end

    def self.all
      all_markets = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/markets.csv").each do |line|
        all_markets[line[0].to_i] = self.new(line[0].to_i,line[1],line[2],line[3],line[4],line[5],line[6])
      end
      return all_markets
    end

    def self.find(id)
      all_markets = self.all

      if all_markets.has_key?(id)
        return all_markets[id]
      else
        raise ArgumentError.new("We do not have a market with that ID.")
      end
    end

    def vendors
      all_vendors = FarMar::Vendor.all

      all_vendors.delete_if do |k, v|
        v.market_id != @id
      end

      return all_vendors
    end
  end

end
