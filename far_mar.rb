# gems your project needs
require 'csv'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/market.rb'
require_relative 'lib/product.rb'
require_relative 'lib/sale.rb'
require_relative 'lib/vendor.rb'
