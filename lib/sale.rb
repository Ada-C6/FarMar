# September 7th, 2016
#sale.rb
#This program reads a sales file and returns the instances within the file.
#This program also returns the following:
  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

require 'awesome_print'
require 'csv'
require_relative '../far_mar'
require_relative './file'
require_relative './vendor'
require_relative './market'
require_relative './product'


class FarMar::Sale < FarMar::ReadingFile
  attr_reader :sale_id, :amount, :vendor_id, :product_id

  attr_accessor :purchase_time

  FILENAME = "./support/sales.csv"

  def initialize(info)
    @sale_id = info[0]
    @amount = info[1]
    @purchase_time = DateTime.parse(info[2])
    @vendor_id = info[3]
    @product_id = info[4]
  end

# returns a collection of instances - inherit from parent class FarMar::ReadingFile
  def self.all
    return import_all_file(FILENAME).map {|row| self.new(row)}
  end

#returns an instance of the object - inherit from parent class FarMar::ReadingFile
  def self.find(sal_id)
    return self.new(find_instance(FILENAME, sal_id))
  end

#returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  def vendor
    return array_of_instances(FarMar::Vendor.all, "vendor_id", vendor_id).first
  end

#returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  def product
    return array_of_instances(FarMar::Product.all, "product_id", product_id).first
  end

#returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  def self.between (beginning_time, end_time)
    return_array = []

    self.all.each do |sale|
      if sale.purchase_time >= beginning_time && sale.purchase_time <= end_time
        return_array << sale
      end
    end

    return return_array
  end
end

################## TESTING ################
#
# FarMar::Sale.between(DateTime.parse("2013-11-06 08:38:38 -0800"),DateTime.parse("2013-11-06 08:43:15 -0800")).each do |item|
#   puts item.name
# end
