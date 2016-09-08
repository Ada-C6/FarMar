require 'csv'


require_relative 'lib/market.rb'
require_relative 'lib/vendor.rb'
require_relative 'lib/product.rb'
require_relative 'lib/sale.rb'


module FarMar
end
# puts FarMar::Market.all
# market = FarMar::Market.new(2,"Test Market","123 Main St","King", "Seattle", "WA", "98125")

sale = FarMar::Sale.new(1,200,"12:00",1,1)  #testing an instance method
puts sale.vendor.id

# puts FarMar::Product.by_vendor(1) # testing class methods
