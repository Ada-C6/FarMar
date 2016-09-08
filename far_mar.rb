# [x] gems your project needs
require 'csv'
require 'simplecov'
require 'minitest/reporters'

# [x] our namespace module
module FarMar; end

# all of our data classes that live in the module
#require 'lib/far_mar_market'

# [x] ...require all needed classes
puts "Loading the project library."

require './lib/Market'
require './lib/Product'
require './lib/Sale'
require './lib/Vendor'

puts "Done Loading library!"


###### TESTING MARKET
market_array = CSV.read('./support/markets.csv') # reads a line, and produces an array of an array of strings

puts "We loaded #{market_array.length} Market arrays." 

puts "This is the first Market array"
print market_array[0]
puts "\n\n"
print market_array[0][1]
puts "\n\n"

# add additional pieces for constructor
nada_whole_fudz = FarMar::Market.new(market_array[0])
puts "\n\n\n"

#puts nada_whole_fudz.inspect
#FarMar::Market.all


############ TESTING VENDOR 
puts "Loading Vendor.rb data...\n.\n.\n." # puts logging

vendor_array = CSV.read('./support/vendors.csv')

puts "We loaded #{vendor_array.length} Vendor arrays.\n\n"

puts

vendor_1 = FarMar::Vendor.new(vendor_row)


puts vendor_1

############### TESTING SALE



############### TESTING 






























