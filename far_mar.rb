##MODULE

# gems your project needs
require 'csv'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/Market'
require_relative 'lib/Vendor'
require_relative 'lib/Product'
require_relative 'lib/Sale'
# ...require all needed classes
