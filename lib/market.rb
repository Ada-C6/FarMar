require 'csv'
module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip

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
      info = {}
      CSV.read('support/markets.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        address = line[2]
        city = line[3]
        county = line[4]
        state = line[5]
        zip = line[6]
        info[id] = self.new(id, name, address, city, county, state, zip)
      end
      return info
    end

    def self.find(id)
      return self.all[id]
    end

    def vendors
      # FarMar::Vendor.by_market(@id)

      vendors = []
      CSV.read('support/vendors.csv').each do |line|
        if line[-1].to_i == @id
          vendors << line
        end
      end
      return vendors

    #   all_vendors = FarMar::Vendor.all
    #   vendors = []
    #
    #   all_vendors.each do |vendor, value|
    #     if value.market_id == @id
    #       vendors << value
    #     end
    #   end
    #   return vendors
    end

  end
end

# all_markets = FarMar::Market.all
# west_seattle = all_markets[5]
#
# puts west_seattle.vendors
