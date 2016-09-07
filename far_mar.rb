require 'csv'

module FarMar
end

require_relative './lib/market'
require_relative './lib/vendor'
require_relative './lib/product'
require_relative './lib/sale'


##TESTING... FarMar::Market.all
# test = FarMar::Market.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.name
#     puts ""
# end
#
# puts "end of test"
