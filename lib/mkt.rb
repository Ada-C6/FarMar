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
     mkt = {}
        CSV.read('../support/markets.csv').each do |line|
          mkt[line[0]] = Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
        end
      return mkt
    end

    def self.find(id)
        Market.all[id]
    end

    def self.vendors
      newest = { }
      m = Market.all[@id]
      n = Vendor.all
        if Market.all[@id] == Vendor.all[@market_id]
         newest[m[@id]] = Vendor.new[[3],n[0],n[1],n[2]]
       else
      exit
        end
    end
  end
end
puts FarMar::Market.vendors
