# gems your project needs
require 'csv'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative './lib/farmar_market'
require_relative './lib/farmar_product'
require_relative './lib/farmar_sale'
require_relative './lib/farmar_vendor'
# ...require all needed classes
