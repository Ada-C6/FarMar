require 'CSV'
module FarMar
require_relative 'lib/Market'
require_relative 'lib/Product'
require_relative 'lib/Sale'
require_relative 'lib/Vendor'
end


# puts foots = FarMar::Market.find(20) #here, I'm calling a particular market with an id of 20
# puts foots.vendors #shouldn't i get back an array of vendors at market 20?
