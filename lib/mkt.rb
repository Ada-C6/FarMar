#need to access the csv 'markets', retrieve instances of market + create new instances
require 'csv'
require_relative 'vendor'

module FarMar

  class Market
    attr_accessor :id, :name, :street, :city, :county, :state, :zip
    def initialize(id, name, street, city, county, state, zip)
      @id = id
      @name= name
      @street = street
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      mkt= { }
        CSV.read('../support/markets.csv').each do |line|
          mkt[line[0]] = Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
        end
      return mkt
    end

    def self.find(id)
      return Market.all[id]
    end

    #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    def self.vendors
      newest = { }
      m = Market.all[0]
      n = FarMar::Vendor.all
       if Market.all[0] == Vendor.all[0]
         newest[m[0]] = Vendor.new(n[3],n[0],n[1],n[2])
       end
    end
  end
end


#if there's time, work on pushing new instances to markets.csv
#puts FarMar::Market.all
puts FarMar::Market.vendors
puts FarMar::Market.find("492")
puts FarMar::Market.find("498")
puts FarMar::Market.find("32")
#n = FarMar::Market.new("9999999","Natasha","737 Olive Way","Seattle","King","WA","98101")
puts FarMar::Market.find("9999999")
