require 'csv'

# lib/farmar_market/farmar_product.rb
module FarMar
  class Product

    attr_reader :product_id, :product_name, :vendor_id

    def initialize(product_hash)
      @product_id = product_hash[:product_id]
      @product_name = product_hash[:product_name]
      @vendor_id = product_hash[:vendor_id]
    end

    def self.all
      product_csv_file = CSV.read("../FarMar/support/products.csv")
      product_array = []

      product_csv_file.each do |market|
        product_hash = {}
        product_hash[:product_id] = market[0].to_i
        product_hash[:product_name] = market[1].to_s
        product_hash[:vendor_id] = market[2].to_i

        product_array << self.new(product_hash)
      end
      return product_array
    end

    def self.find(id)
      products = self.all
      products.each do |product|
        if product.product_id == id.to_i
          return product
        end
      end
      raise Exception("ID was not present")
    end

    def self.by_vendor(vendor_id)
      all_products = all
      associated_products = []

      all_products.each do |product|

        if product.vendor_id == vendor_id
          associated_products.push(product)
        end
      end
      return associated_products
    end

  end
end
