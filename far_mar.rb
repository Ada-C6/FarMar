require 'csv'


require_relative 'lib/market.rb'
require_relative 'lib/vendor.rb'
require_relative 'lib/product.rb'
require_relative 'lib/sale.rb'


module FarMar
end
# puts FarMar::Market.all
market = FarMar::Market.new(2,"Test Market","123 Main St","King", "Seattle", "WA", "98125")

puts market.vendors
