require 'csv'
#require_relative 'market'
#require_relative 'product'
#require_relative 'sale'

module FarMar
  class Vendor
    attr_reader :vendor_id, :name, :employees, :market_id
    attr_accessor
    attr_writer

    def initialize(vendor_hash)
      @vendor_id = vendor_hash["vendor_id"]
      @name = vendor_hash["name"]
      @employees = vendor_hash["employees"]
      @market_id = vendor_hash["market_id"]
    end

    def self.all
      vendors = []
      CSV.read("./support/vendors.csv").each do |line|
        vendor_hash = {}
        vendor_hash["vendor_id"] = line[0].to_i
        vendor_hash["name"] = line[1]
        vendor_hash["employees"] = line[2].to_i
        vendor_hash["market_id"] = line[3].to_i
        vendors << FarMar::Vendor.new(vendor_hash)
      end
      return vendors
    end

    def self.find(input)
      vendors = self.all
      vendors.each do |var|
        if var.vendor_id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Vendor ID #{ @vendor_id }, named #{ @name }, has #{ @employees } employees #{ @amount } and is sold at Market ID #{ @market_id }."
    end



  end
end
