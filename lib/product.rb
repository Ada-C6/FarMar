module FarMar
  class Product
    attr_reader :id, :name, :vendor_id
    def initialize(id,name,vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end


    def self.all
      products = {}
      CSV.read('support/products.csv').each do |line|
        product = self.new(line[0].to_i,line[1],line[2].to_i)
        products[product.id] = product
      end
      return products
    end
    def self.find(id)
      products = self.all
      return products[id]
    end

  end
end
