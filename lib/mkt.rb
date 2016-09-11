module FarMar

  class Market
    @@all_markets = nil
    attr_accessor :id, :name, :street, :city, :county, :state, :zip
    def initialize(id, name, street, city, county, state, zip)
      @id = id
      @name= name
      @street = street
      @city = city
      @county = county
      @state = state
      @zip = zip
      @vendors = Vendor.by_market(id)
    end

    def vendors
      return @vendors
    end

    def self.all
      if @@all_markets == nil
         mkt = {}
            CSV.read('./support/markets.csv').each do |line|
              mkt[line[0]] = Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
            end
        @@all_markets = mkt
      end
      return @@all_markets
    end

    def self.find(id)
        Market.all[id]
    end

  end
end
