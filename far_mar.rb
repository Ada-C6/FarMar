require 'csv'


require_relative 'lib/market.rb'
require_relative 'lib/vendor.rb'
require_relative 'lib/product.rb'
require_relative 'lib/sale.rb'


module FarMar
end
# puts FarMar::Market.all
# market = FarMar::Market.new(2,"Test Market","123 Main St","King", "Seattle", "WA", "98125")
#
# sale = FarMar::Sale.new(1,200,"12:00",1,1)  #testing an instance method
# puts sale.

# date = DateTime.parse("2013-11-08 04:31:41 -0800")
#
# puts date.class

puts FarMar::Sale.between("1001-11-08 04:31:41 -0800","2013-11-08 16:36:03 -0800").length

# all = FarMar::Sale.all.map do |k, v|
#   v.purchase_time
# end
#
# puts all.sort
