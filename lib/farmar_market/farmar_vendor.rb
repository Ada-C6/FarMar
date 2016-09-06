require 'csv'

# lib/farmar_market/farmar_vendor.rb
module FarMar
  class Vendor

    attr_reader :vendor_csv

    def initialize
      @vendor_csv = CSV.read("../FarMar/support/vendors.csv", "r")
    end

  end
end
