require 'csv'
require 'time'

module FarMar
  class Sale
    attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
    attr_accessor
    attr_writer

    def initialize(sale_hash)
      @sale_id = sale_hash["sale_id"]
      @amount = sale_hash["amount"]
      @purchase_time = sale_hash["purchase_time"]
      @vendor_id = sale_hash["vendor_id"]
      @product_id = sale_hash["product_id"]
    end

    # Class method that reads the CSV file to generate an array of sales hashes
    def self.all
      sales = []
      CSV.read("./support/sales.csv").each do |line|
        sale_hash = {}
        sale_hash["sale_id"] = line[0].to_i
        sale_hash["amount"] = line[1].to_i
        sale_hash["purchase_time"] = line[2]
        sale_hash["vendor_id"] = line[3].to_i
        sale_hash["product_id"] = line[4].to_i
        sales << FarMar::Sale.new(sale_hash)
      end
      return sales
    end

    # Class method that iterates through sales array and prints out information on
    # the sale with a specified sale_id
    def self.find(input)
      sales = self.all
      sales.each do |var|
        if var.sale_id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Sale ID #{ @sale_id }, purchased at #{ @purchase_time }, refers to Product ID #{ @product_id }, costs #{ @amount } and is sold by Vendor ID #{ @vendor_id }."
    end

    # Instance method that iterates through vendors array to find the one with a vendor_id
    # that matches the sale's instance of vendor_id
    def vendor
      vendors = FarMar::Vendor.all
      vendors.each do |var|
        if var.vendor_id == @vendor_id # Need only one instance of vendor_id
          return var
        end
      end
    end

    # Instance method that iterates through all products to find the one with a product_id
    # that matches the sale's instance of product_id
    def product
      products = FarMar::Product.all
      products.each do |var|
        if var.product_id == @product_id # Need one instance of product_id
          return var
        end
      end
    end

    # Class method that returns an array of Sale objects where the purchase time is
    # between the specified beginning and end times
    def self.between(beginning_time, end_time)
      sales = self.all
      sold_objects = []
      sales.each do
        if (beginning_time <= sales.Time.new(purchase_time)) && (end_time >= sales.Time.new(purchase_time))
          sold_objects << sale
        end
      end
      return sold_objects
    end
  end
end
