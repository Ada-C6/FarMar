module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

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
    market_array = []
    CSV.read("/Users/yasminor/ada/Week_5/FarMar/support/markets.csv").each_with_index do |line, i|
      market_array[i] = self.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
    end
    return market_array
  end

  def self.find(id)
    object_array = FarMar::Market.all
    object_array.map do |market|
      if market.id.to_i == id
        return market
      end
    end
  end

  def vendors #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field
    FarMar::Vendor.by_market(@id)
    # market_vendors_array = []
    # vendor_array = FarMar::Vendor.all #the id matches the market instance's id and the market_id of the vendors
    # vendor_array.map do |vendor|
    #   if vendor.market_id == @id.to_s
    #     market_vendors_array << vendor
    #   end
    # end
    # return market_vendors_array
  end

  end
end
