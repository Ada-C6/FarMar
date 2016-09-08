puts "Loading Market.rb"

class FarMar::Market

  attr_reader :MARKET_ID, :name, :city, :county, :state, :zip

  def initialize(market_row) # could take an array

    @MARKET_ID = market_row[0]
    @name = market_row[1]
    @city = market_row[3]
    @county = market_row[4]
    @state = market_row[5]
    @zip = market_row[6]
    
  end 

  def self.all
    # collection use array 

  end

end
# werks
# CSV.foreach('./support/markets.csv') do |row|
#   puts row.inspect
# end

market_array = CSV.read('./support/markets.csv') # reads a line, and produces an array of an array of strings

puts "We loaded #{market_array.length} arrays." 

puts "This is the first array"
print market_array[0]
puts
print market_array[0][1]
puts "\n\n"
# add additional pieces for constructor
really_dumb_market = FarMar::Market.new(market_array[0])
puts really_dumb_market.inspect




FarMar::Market.all



























puts "Done loading Market.rb"

