require 'csv'

# lib/farmar_market/farmar_vendor.rb
module FarMar
  class Vendor

    attr_reader :vendor_id, :vendor_name, :num_employees, :market_id

    def initialize(market_hash)
      @vendor_id = market_hash[:vendor_id]
      @vendor_name = market_hash[:vendor_name]
      @num_employees = market_hash[:num_employees]
      @market_id = market_hash[:market_id]
    end

    def self.all
      vendor_csv_file = CSV.read("../FarMar/support/vendors.csv")
      vendor_array = []

      vendor_csv_file.each do |vendor|
        vendor_hash = {}
        vendor_hash[:vendor_id] = vendor[0].to_i
        vendor_hash[:vendor_name] = vendor[1].to_s
        vendor_hash[:num_employees] = vendor[2].to_i
        vendor_hash[:vendor_id] = vendor[3].to_i
        vendor_array << self.new(vendor_hash)
      end
      return vendor_array
    end

    def self.find(id)
      vendors = self.all
      vendors.each do |vendor|
        if vendor.vendor_id == id.to_i
          return vendor
        end
      end
      raise Exception("ID was not present")
    end

  end
end
