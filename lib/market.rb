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
      @product_in_market = []
    end

    # Reads the CSV file to generate an array of market hashes
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

    # Goes through the generated market array to find markets with a
    # specified market_id and prints information about them
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

    # Returns an array of vendors that are associated with a
    # market according to its market_id
    def vendors
      return FarMar::Vendor.by_market(market_id)
    end

    # Class method that returns an array of Market instances where the market name
    # contains the search term
    def self.search(search_term)
      markets = self.all
      matching_values = []
      markets.each do |market|
        if market.name.include?(search_term)
          matching_values << market
        end
      end
      return matching_values
    end

    # # Instance method that returns an array of products found in a particular market
    # # I could not figure out how to do this, but I gave it my best shot!
    # def products
    #   # Use FarMar::Vendor #products to find products and vendors whose vendor_ids match.
    #   # I'm not sure how to get around the fact that FarMar::Vendor #products
    #   # references self.by_vendor(vendor_id), which requires an input value
    #   products_by_vendor = FarMar::Vendor.new.products
    #   # Iterate through those product/vendor combos to find the markets whose market_ids
    #   # match those combinations
    #   products_by_vendor.each do |var|
    #     if var.market_id == @market_id # Need one instance of market_id (don't need @ sign)
    #       @product_in_market << var
    #     end
    #   end
    #   return @product_in_market
    # end
  end
end
