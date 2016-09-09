require 'csv'
require_relative './lib/market'
require_relative './lib/product'
require_relative './lib/sale'
require_relative './lib/vendor'

module FarMar
end

a = FarMar::Market.all.sample
puts a.vendors.length
puts a.products
puts a.products[0].vendor_id
puts a.products[2].vendor_id
