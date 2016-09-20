class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip_code

  def initialize(id, name, address, city, county, state, zip_code) # could take an array
    #initialize is NOT a constructor see the iterwebs
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip_code = zip_code
    
  end 

  # returns an array of market objects e.g [#<FarMar::Market:0x007ff14981dac0>]
  def self.all # works as desired [] repeat for each class
    
    market_array = []

    CSV.foreach('./support/markets.csv') do |line|
      # maybe I do need to build an hash (dict)
      # instance variables would be the key/ import csv data would be the value
      id = line[0]
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip_code = line[6]

      market_array << FarMar::Market.new(id, name, address, city, county, state, zip_code)
      # market_array is an array of market objects e.g [#<FarMar::Market:0x007ff14981dac0>]
     end
     return market_array
  end

  # returns the market object or nil associated with the Market id

  def self.find(id) # this parameter takes string
      # find the market object with the id
      found_market = nil # because there is no string
      
      all.each do |market|
        if market.id == id
          found_market = market
          break
        end
      end
      return found_market
  end

  # returns an array of vendors whose market_id matches this markets id
  # instance method stuck to the current instantiation of market
  def vendors #111 for the test case

    found_vendor = []

    FarMar::Vendor.all.each do |vendor|
      if vendor.market_id == @id
         found_vendor.push(vendor)
      end   
    end
    return found_vendor
  end
end

# testing content moved to far_mar.rb
# instance method must call on the INSTANCE
# class methods call directly on the class

# initialize during the instantiation of the instance variables
# a market is a line
# a row is column



























