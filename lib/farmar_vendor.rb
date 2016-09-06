# lib/farmar_vendor.rb
# require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id
  def initialize(id, amount, purchase_time, vendor_id, product_id)
    @id = id
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  # load vendor infomation from vendor csv file
  # input: csv file name (optional)
  # output: an array of class Vendor objects
  def self.all
    vendor_csv_file = "/Users/mengyao/ADA_class/FarMar/support/vendors.csv"

    vendors = []
    CSV.foreach(vendor_csv_file) do |row|
      id = row[0].to_s
      amount = row[1].to_s
      purchase_time =row[2].to_s
      vendor_id = row[3].to_s
      product_id = row[4].to_s

      vendors << FarMar::Vendor.new(id, amount, purchase_time, vendor_id, product_id)
    end
    return vendors
  end

  # identify vendor information by vendor id
  # input: vendor id (string)
  # output: an vendor object that corresponds to the given vendor id
  def self.find(id)
    found_vendor = nil
    all.each do |vendor|
      if id == vendor.id
        found_vendor = vendor
        break
      end
    end
    return found_vendor
  end
end
