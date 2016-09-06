# gems your project needs
require 'csv'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/market'
require_relative 'lib/Product'
require_relative 'lib/sale'
require_relative 'lib/vendor'
# ...require all needed classes


# The module provides a namespace for the
# application. A namespace ensures the classes
# we create will not 'collide' or 'overlap' with a class that could exist elsewhere in a codebase (like in a gem).
#
# For example, Sale is a very generic class name that could very realistically exist in many codebases. Creating
 # a module called FarMar allows us to specify which Sale we're talking about; FarMar::Sale is much more explicit and likely to be unique.
