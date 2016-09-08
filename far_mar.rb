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
# product = FarMar::Product.new("1","Dry Beets","1")
# puts product.number_of_sales

# puts FarMar::Sale.between("2013-11-03 04:34:56 -0800","2013-11-03 05:14:56 -0900").size
# => 12798

# market = FarMar::Market.new("2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383")
# puts market.products("2").size
# => 3

# puts FarMar::Market.search("school").size

 # market = FarMar::Market.new("2","Silverdale Farmers Market","98383","Silverdale","Kitsap","Washington","98383")
 # puts market.prefered_vendor.inspect
