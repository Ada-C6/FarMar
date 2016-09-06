require 'csv'

module FarMar
  class Product

    def initialize(id, product, vendor_id)
      @id = id
      @product = product
      @vendor_id = vendor_id
    end

    def self.all
      all_products = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/products.csv").each do |line|
        all_products[line[0]] = self.new(line[0].to_i,line[1],line[2].to_i)
      end
      return all_products
    end

  end

end
