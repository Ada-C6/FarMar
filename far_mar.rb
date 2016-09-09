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

###################################
######  TESTING MARKET ############
###################################
puts "\n\n\nTime to test the Market class methods!\n\n"
# puts "Started loading data!\n\n\n"
# puts FarMar::Market.all.inspect # works as desired
# puts "Done loading data!"
#for class method call syntax is Module::class.method(* put parameters here if needed) (don't include the self part)

# if there is a parameter write the arugment here

# FarMar::Market.all # this will match one of the the market id numbers

puts "This is the Market object that matches the id #{FarMar::Market.find('4')}"
puts "This is what the Market object that matches the id #{FarMar::Market.find('4').inspect}"


# add additional pieces for constructor

#puts nada_whole_fudz.inspect
#FarMar::Market.all

#############################################
############  TESTING VENDOR  ###############
#############################################

puts "\n\n\nTime to test the Vendor class methods!\n\n" # puts logging

# vendor_array = CSV.read('./support/vendors.csv')

# puts "We loaded #{vendor_array.length} Vendor arrays.\n\n"

# puts

# vendor_1 = FarMar::Vendor.new(vendor_row)


# puts vendor_1
#puts FarMar::Vendor.all
puts "This is the Vendor object that matches the vendor id #{FarMar::Vendor.find('4')}"
puts "This is what the Vendor object that matches the vendor id #{FarMar::Vendor.find('4').inspect} class."

################################################
############### TESTING SALE  ##################
################################################

puts "\n\n\nTime to test the Sale class methods!\n\n"
puts "This is the Sale object that matches the sale id #{FarMar::Sale.find('4')}"
puts "This is what the Sale object that matches the sale id #{FarMar::Sale.find('4').inspect} class."

################################################
############### TESTING PRODUCT ################
################################################

puts "\n\n\nTime to test the Product class methods!\n\n"
puts "This is the Product object that matches the Product id #{FarMar::Product.find('4')}"
puts "This is what the Product object that matches the PRODUCTb id #{FarMar::Product.find('4').inspect} class."






























