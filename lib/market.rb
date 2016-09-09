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

    # Returns a collection of instances, representing all of the objects described in the CSV
    def self.all
      markets = {}
      CSV.read('support/markets.csv').each do |line|
        #these are the arguments fed into the class instance -don't confuse with an array
        market = self.new(line[0].to_i,line[1],line[2],line[3],line[4],line[5],line[6])
        markets[market.id] = market
      end
      return markets
    end

    # Returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
    def self.find(id)
      markets = self.all
      return markets[id]
    end

    #Returns a collection of Vendor instances, associated with the market by the market_id field.
    def vendors
      market_vendors = Vendor.all.select { |vendor_id, vendor|
        vendor.market_id == id } # id is attr_reader id, no need for argument
      return market_vendors
      # Refactoring from:
      # market_vendors = {}
      # Vendor.all.each do |vendor_id, vendor|
      #   if vendor.market_id == id # id is attr_reader id, no need for argument
      #     market_vendors[vendor_id] = vendor
      #   end
      # end #each
      # return market_vendors
    end

  end #class
end #module
