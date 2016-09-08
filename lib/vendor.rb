require 'csv'

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
      @sales_by_vendor = []
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

    def self.by_market(input)
      vendor_by_market = []
      vendors = self.all
      vendors.each do |var|
        if var.market_id == input
          vendor_by_market << var
        end
      end
      return vendor_by_market
    end

    def market
      markets = FarMar::Market.all
      markets.each do |var|
        if var.market_id == @market_id # Need one instance of market_id (don't need @ sign)
          return var
        end
      end
    end

    def products
      return FarMar::Product.by_vendor(vendor_id)
    end

    def sales
      sales = FarMar::Sale.all
      sales.each do |var|
        if var.vendor_id == @vendor_id
          @sales_by_vendor << var
        end
      end
      return @sales_by_vendor
    end

    def revenue
      sales
      revenue = 0
      @sales_by_vendor.each do |i|
        revenue += i.amount
      end
      return revenue
    end

  end
end
