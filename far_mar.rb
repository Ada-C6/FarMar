# [] gems your project needs
require 'csv'
require 'simplecov'
require 'minitest-reporter'

# [x] our namespace module
module FarMar; end

# all of our data classes that live in the module
require 'lib/farmar_market'

# [] ...require all needed classes
require 'lib/Market.rb'
require 'lib/Product.rb'
require 'lib/Sale.rb'
require 'lib/Vendor.rb'