require 'csv'

module FarMar
end

require_relative './lib/market'
require_relative './lib/vendor'
require_relative './lib/product'
require_relative './lib/sale'


##TESTING... FarMar::Product.find(id)
# test = FarMar::Product.find(FarMar::Product.all[0].id)
# puts test
#
# puts "Woo hoo!"


# #TESTING... FarMar::Product.all
# test = FarMar::Product.all
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




##TESTING... FarMar::Vendor.find(id)
# test = FarMar::Vendor.find(FarMar::Vendor.all[0].id)
# puts test
#
# puts "Woo hoo!"


# #TESTING... FarMar::Vendor.all
# test = FarMar::Vendor.all
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




##TESTING... FarMar::Market.find(id)
# test = FarMar::Market.find(FarMar::Market.all[0].id)
# puts test
#
# puts "Woo hoo!"


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
