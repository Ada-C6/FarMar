# September 6th, 2016
# market.rb
# This program reads a market file and returns the instances within the file
# This program also returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

require 'csv'
require_relative '../far_mar'
require_relative './file'
require_relative './vendor'


class FarMar::Market < FarMar::ReadingFile
  attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  FILENAME = "./support/markets.csv"

  def initialize(info)
    @market_id = info[0]
    @name = info[1]
    @address = info[2]
    @city = info[3]
    @county = info[4]
    @state = info[5]
    @zip = info[6]
  end


#returns a collection of instances - inherit from parent class FarMar::ReadingFile
  def self.all
    return import_all_file(FILENAME).map {|row| self.new(row)}
  end

#returns an instance of the object with the matching id - inherit from parent class FarMar::ReadingFile
  def self.find(mark_id)
    return self.new(find_instance(FILENAME, mark_id))
  end

#returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  def vendor
    return array_of_instances(FarMar::Vendor.all, "market_id", market_id)
  end

end


########## TEST ##############
# puts FarMar::Market.all[1].name #=> expected value Silverdale Farmers Market
# puts FarMar::Market.find(5).name #=> expected value Quincy Farmers Market
#
# mart = FarMar::Market.new(["1", "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202"])
#
# puts mart.vendor(mart.market_id).length #=> expected value 6
