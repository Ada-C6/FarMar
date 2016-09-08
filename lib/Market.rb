 # require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip, :vendors_at_market
  # def initialize(name)
  #   @name = name
  #
  # end
  def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address= address
      @city = city
      @county = county
      @state = state
      @zip = zip
      @vendors_at_market = []

  end #end initialize method

  def self.all
    markets_hash = {}
    CSV.read("support/markets.csv").each do |line|
      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6]
      markets_hash[id] = self.new(id, name, address, city, county, state, zip)
    end
    return markets_hash
  end

  def self.find(id)
    return self.all[id]
      # self.all.each do |market|
      #   if market.id == @id
      #     return market
      #   end
      # end
  end

  #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

  def vendors
    all_vendors = FarMar::Vendor.all

    all_vendors.each do |vendor, value|
      if  @id == value.market_id
         @vendors_at_market << value
      end
     end
     return @vendors_at_market

  end #end vendors method


  end


end
