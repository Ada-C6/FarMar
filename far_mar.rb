require 'csv'

module FarMar
end

require_relative './lib/market'
require_relative './lib/vendor'
require_relative './lib/product'
require_relative './lib/sale'


##TEST #10... FarMar::Market.vendors
# m = FarMar::Market.all.last
# print "I expect the two market id's below to be:"
# puts m.vendors.first.market_id
# puts m.vendors.last.market_id
# puts "Did this work?"




##TEST #9... FarMar::Vendor.by_market(market_id)
# print "Here's the market I'm calling in the vendor method below:"
# puts market_id = FarMar::Market.all.last.id
#
# vendor_tests = FarMar::Vendor.by_market(market_id)
#
# puts "Here are the vendor objects"
# puts vendor_tests
#
# puts "Here's the confirmation that all of the market_id's in these objects (last line before the line break) match the market id noted above..."
# vendor_tests.each do |item|
#     puts item.id
#     puts item.name
#     puts item.market_id
#     puts ""
# end
#
# puts "Glorious!"


##TEST #8... FarMar::Sale.find(id)
# test = FarMar::Sale.find(FarMar::Sale.all[0].id)
# puts test
#
# puts "Woo hoo!"


# #TEST #7... FarMar::Sale.all
# test = FarMar::Sale.all
#
# puts "Woo hoo!"
#
# test.each do |item|
#     puts item.id
#     puts item.purchase_time
#     puts ""
# end
#
# puts "end of test"



##TEST #6... FarMar::Product.find(id)
# test = FarMar::Product.find(FarMar::Product.all[0].id)
# puts test
#
# puts "Woo hoo!"


# #TEST #5... FarMar::Product.all
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




##TEST #4... FarMar::Vendor.find(id)
# test = FarMar::Vendor.find(FarMar::Vendor.all[0].id)
# puts test
#
# puts "Woo hoo!"


# #TEST #3... FarMar::Vendor.all
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




##TEST #2... FarMar::Market.find(id)
# test = FarMar::Market.find(FarMar::Market.all[0].id)
# puts test
#
# puts "Woo hoo!"


##TEST #1... FarMar::Market.all
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
