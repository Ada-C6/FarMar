module FarMar
  class Market
    attr_reader :id, :name

    def initialize(market_hash)

      @id = market_hash[:id]
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]

    end

    def self.read
      markets = [] #array to store all of the hashes with market info
      CSV.read("../FarMar/support/markets.csv").each do |line|
        market = {
          id: line[0].to_i,
          name: line[1],
          address: line[2],
          city: line[3],
          county: line[4],
          state: line[5],
          zip: line[6]
        } #create a new hash for each market to store specific info

        markets << self.new(market) #creates a new instance with the hash info and puts it in the array to be returned
      end
      markets #returns this array
    end

    def self.all #what happens if the csv file is updated - this variable will not include new data
      @@all_markets ||= self.read
      return @@all_markets
    end

    def self.find(id)
      if FarMar::Market.ids.include?(id)
        self.all.find { |m| m.id == id }
      else
        raise ArgumentError.new("There are no vendors with that id")
      end
    end

    def vendors #returns a collection of FarMar::Vendor instances that are associated with the market
      FarMar::Vendor.by_market(@id) #has clause for ArgError in method
    end

    def self.ids
      market_ids = []

      self.all.each do |m|
        market_ids << m.id
      end
      return market_ids
    end

    def products #returns an array of Products that are associated to the market via the Vendor class
      all_products = []

      this_markets_vendors = FarMar::Vendor.by_market(@id) #returns array of Vendors

      this_markets_vendors.each do |v|
        vendor_products = FarMar::Product.by_vendor(v.id) #returns array of Products
        vendor_products.each do |pro|
          all_products << pro
        end
      end
      return all_products
    end

      #find all vendors associated with this market
      #find all products associated with those vendors
    #end
  end
end
