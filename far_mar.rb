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
































