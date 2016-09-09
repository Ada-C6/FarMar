class FarMar::Market

  attr_reader :id, :name, :city, :county, :state, :zip

  def initialize(id, name, address, city, county, state, zip) # could take an array
    #initialize is NOT a constructor see the iterwebs
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
    
  end 

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
      zip = line[6]

      market_array << FarMar::Market.new(id, name, address, city, county, state, zip)
      # market_array is an array of market objects e.g [#<FarMar::Market:0x007ff14981dac0>]
     end
     return market_array
  end

  # returns an the market object associated with the Market id

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
end

# testing content moved to far_mar.rb
# instance method must call on the INSTANCE
# class methods call directly on the class

# initialize during the instantiation of the instance variables
# a market is a line
# a row is column


























puts "Done loading Market.rb"

