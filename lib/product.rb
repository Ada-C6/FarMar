require 'csv'

module FarMar
  class Product
    attr_reader :product_id, :name, :vendor_id
    attr_accessor
    attr_writer

    def initialize(product_hash)
      @product_id = product_hash["product_id"]
      @name = product_hash["name"]
      @vendor_id = product_hash["vendor_id"]
      @sales_by_product = []
    end

    # Class method that reads from a CSV file to generate an array of product hashes
    def self.all
      products = []
      CSV.read("./support/products.csv").each do |line|
        product_hash = {}
        product_hash["product_id"] = line[0].to_i
        product_hash["name"] = line[1]
        product_hash["vendor_id"] = line[2].to_i
        products << FarMar::Product.new(product_hash)
      end
      return products
    end

    # Class method that uses product array to print information about a product
    # with a specified product_id
    def self.find(input)
      products = self.all
      products.each do |var|
        if var.product_id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Product ID #{ @product_id } is named #{ @name } and is sold by Vendor ID #{ @vendor_id }."
    end

    # Class method that generates an array of products with a specified vendor_id
    def self.by_vendor(input)
      product_by_vendor = []
      products = self.all
      products.each do |var|
        if var.vendor_id == input
          product_by_vendor << var
        end
      end
      return product_by_vendor
    end

    # Instance method that finds a the vendor whose vendor_id matches
    # that of the product instance
    def vendor
      vendors = FarMar::Vendor.all
      vendors.each do |var|
        if var.vendor_id == @vendor_id # Need one instance of market_id (don't need @ sign)
          return var
        end
      end
    end

    # Instance method that returns an array of sales associated with
    # a product's product_id
    def sales
      sales = FarMar::Sale.all
      sales.each do |var|
        if var.product_id == @product_id
          @sales_by_product << sales
        end
      end
      return @sales_by_product
    end
  end
end
