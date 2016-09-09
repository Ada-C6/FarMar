# September 6th, 2016
# vendor.rb
# This program reads a vendor file and returns the instances within the file.
# This program also does the following:
  # market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  # products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  # sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  # revenue: returns the the sum of all of the vendor's sales (in cents)
  # self.by_market(market_id): returns all of the vendors with the given market_id

require 'csv'
require_relative '../far_mar'
require_relative './file'
require_relative './product'
require_relative './market'
require_relative './sale'


class FarMar::Vendor < FarMar::ReadingFile
  attr_reader :vendor_id, :name, :num_of_employees, :market_id

  FILENAME = "./support/vendors.csv"

  def initialize(info)
    @vendor_id = info[0]
    @name = info[1]
    @num_of_employees = info[2]
    @market_id = info[3]
  end

# returns a collection of instances - inherit from parent class FarMar::ReadingFile
  def self.all
    return import_all_file(FILENAME).map {|row| self.new(row)}
  end


#returns an instance of the object - inherit from parent class FarMar::ReadingFile
  def self.find(ven_id)
    return self.new(find_instance(FILENAME, ven_id))
  end

#returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  def market
    return array_of_instances(FarMar::Market.all, "market_id", market_id)
  end

#returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  def products
    return array_of_instances(FarMar::Product.all, "vendor_id", vendor_id)
  end

#returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def sale
    return array_of_instances(FarMar::Sale.all, "vendor_id", vendor_id)
  end

#returns the the sum of all of the vendor's sales (in cents)
  def revenue
    sum = 0
    sale_array = array_of_instances(FarMar::Sale.all, "vendor_id", vendor_id)

    sale_array.each do |item|
      sum += item.amount.to_i
    end
    return sum
  end

#returns all of the vendors with the given market_id
  def self.by_market(mark_id)
    vendors_array = []

    self.all.each do |instance|
      if instance.market_id == mark_id
        vendors_array << instance
      end
    end

    return vendors_array
  end
end


############### TEST ####################
# puts FarMar::Vendor.all[1].name
# puts FarMar::Vendor.find(5).name
# puts FarMar::Vendor.by_market("11")[-1].name
