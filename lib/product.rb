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
        all_products[line[0].to_i] = self.new(line[0].to_i,line[1],line[2].to_i)
      end
      return all_products
    end

    def self.find(id)
      all_products = self.all

      if all_products.has_key?(id)
        return all_products[id]
      else
        raise ArgumentError.new("We do not have a product with that ID.")
      end
    end
  end

end
