class FarMar::Market

  attr_reader :market_id, :name, :city, :county, :state, :zip

  def initialize(market_row) # could take an array
    #initialize is NOT a constructor see the iterwebs
    @market_id = market_row[0]
    @name = market_row[1]
    @city = market_row[3]
    @county = market_row[4]
    @state = market_row[5]
    @zip = market_row[6]
    
  end 

  def self.all
    # need a constructor loops
    market_hash = {}
    CSV.foreach('./support/vendors.csv') do |row|
      # maybe I do need to build an hash (dict)
      # instance variables would be the key/ import csv data would be the value
      market_hash.push(market_row)
    end


  end

end

# testing content moved to far_mar.rb




























puts "Done loading Market.rb"

