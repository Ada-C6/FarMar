require 'csv'

# lib/farmar_market/farmar_product.rb
module FarMar
  class Product

    attr_reader :product_csv

    def initialize
      @product_csv = CSV.read("../FarMar/support/products.csv", "r")
    end

  end
end


product = FarMar::Product.new
puts product.product_csv
