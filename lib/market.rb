module FarMar
  class Market
    attr_reader :id

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      all_markets = {}
      CSV.read('support/markets.csv').each do |line|
        all_markets[line[0].to_i] = self.new(line[0].to_i, line[1], line[2], line[3],line[4], line[5], line[6])
      end
      return all_markets
    end

    def self.find (id)
      markets = self.all
      return markets[id]
    end

    def vendors
      FarMar::Vendor.by_market(@id)
    end

    #products returns a collection of FarMar::Product instances that are associated to the market through theFarMar::Vendor class.
    def products
      products_by_market = []
      #gives me an array of vendors
      venders_by_market = FarMar::Vendor.by_market(@id)

      venders_by_market.each do | value |
        products = FarMar::Product.by_vendor(value.id)
        products_by_market.concat(products)
      end

      return products_by_market
    end
  end
end
