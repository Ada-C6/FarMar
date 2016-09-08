
module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      product_array = []
      CSV.read("/Users/yasminor/ada/Week_5/FarMar/support/products.csv").each_with_index do |line, i|
        product_array[i] = self.new(line[0], line[1], line[2])
      end
      return product_array
    end

    def self.find(id)
      all_products = FarMar::Product.all
      all_products.each do |product|
        if product.id.to_i == id
          return product
        end
    end
  end
end
