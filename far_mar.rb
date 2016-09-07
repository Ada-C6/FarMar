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


# puts FarMar::Market.find("5").inspect
# puts FarMar::Market.new.vendors("3").inspect
# vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
# puts vendor.revenue
# product = FarMar::Product.new("1","Dry Beets","1")
# puts product.sales

product = FarMar::Product.new("1","Dry Beets","1")
puts product.number_of_sales
