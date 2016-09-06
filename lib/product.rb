require 'csv'
#require_relative 'vendor'
#require_relative 'sale'

module FarMar
  class Product
    attr_reader
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
        product_hash[:product_id] = line[0].to_i
        product_hash[:name] = line[1]
        product_hash[:vendor_id] = line[2]
        products << FarMar::Product.new(product_hash)
      end
      return products
    end


  end
end
