require 'csv'


require_relative 'lib/market.rb'
require_relative 'lib/vendor.rb'
require_relative 'lib/product.rb'
require_relative 'lib/sale.rb'


module FarMar
  ##### Testing self methods
  puts Market.search("and")
  #
  ##### Testing instance methods
  # sale = Sale.new(1,200,"12:00",1,1)  #testing an instance method
  # puts sale.
  #
  ##### Testing DateTime craziness
  # date = DateTime.parse("2013-11-08 04:31:41 -0800")
  #
  # puts date.class
  #
  # puts Sale.between("1001-11-08 04:31:41 -0800","2013-11-08 16:36:03 -0800").length
  #
  ##### Sales sorted by date for my own info
  # all = Sale.all.map do |k, v|
  #   v.purchase_time
  # end
  #
  # puts all.sort

end
