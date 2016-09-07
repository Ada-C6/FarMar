module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zipcode

    def initialize(id, name, address, city, county, state, zipcode)
      @id         = id
      @name       = name
      @address    = address
      @city       = city
      @county     = county
      @state      = state
      @zipcode    = zipcode
    end

    def self.all
      markets = {}
      CSV.read('support/markets.csv').each do |line|
        #these are the arguments fed into the class instance -don't confuse with an array
        market = self.new(line[0].to_i,line[1],line[2],line[3],line[4],line[5],line[6])
        markets[market.id] = market
      end
      return markets
    end
    def self.find(id)
      markets = self.all
      return markets[id]
    end

    def vendors
      market_vendors = {}
      Vendor.all.each { |vendor_id, vendor|
        if vendor.market_id == id
          market_vendors[vendor_id] = vendor
        end
      }
      return market_vendors

    end
  end #class
end #module
