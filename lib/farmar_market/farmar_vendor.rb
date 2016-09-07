require 'csv'

# lib/farmar_market/farmar_vendor.rb
module FarMar
  class Vendor

    attr_reader :vendor_id, :vendor_name, :num_employees, :market_id

    def initialize(vendor_hash)
      @vendor_id = vendor_hash[:vendor_id]
      @vendor_name = vendor_hash[:vendor_name]
      @num_employees = vendor_hash[:num_employees]
      @market_id = vendor_hash[:market_id]
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

    def market
      associated_market = FarMar::Market.find(@market_id)
      return associated_market.market_name
    end

    def products
      all_products = FarMar::Product.all
      associated_products = []

      all_products.each do |product|
        if product.vendor_id == @vendor_id
          associated_products.push(product)
        end
        return associated_products
      end
    end

    def sales
      all_sales =
      FarMar::Sale.all
      associated_sales = []

      all_sales.each do |sale|
        if sale.vendor_id == @vendor_id
          associated_sales.push(sale)
        end
        return associated_sales
      end
    end
  end
end
