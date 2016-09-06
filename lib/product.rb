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
    end

    def self.all
      products = []
      CSV.read("./support/products.csv").each do |line|
        product_hash = {}
        product_hash["product_id"] = line[0].to_i
        product_hash["name"] = line[1]
        product_hash["vendor_id"] = line[2]
        products << FarMar::Product.new(product_hash)
      end
      return products
    end

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

  end
end
