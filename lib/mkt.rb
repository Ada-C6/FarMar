#need to access the csv 'markets', retrieve instances of market + create new instances
require 'csv'
module FarMar

  class Market
    attr_accessor :id, :name, :street, :city, :county, :state, :zip
    def initialize(id, name, street, city, county, state, zip)
      self.id = id
      self.name = name
      self.street = street
      self.city = city
      self.county = county
      self.state = state
      self.zip = zip
      #self.instances = instances
    end

    def self.all
      mkt= { }
        CSV.read('../support/markets.csv').each do |line|
          mkt[line[0]] = Market.new(line[0],line[1],line[2],line[3], line[4], line[5], line[6])
        end
      return mkt
    end

    def self.find(id)
        Market.all[id] 
    end
  end
end

#natasha = FarMar::Market.new("9999999","Natasha","737 Olive Way","Seattle","King","WA","98101")
puts FarMar::Market.all
puts FarMar::Market.find("492")
