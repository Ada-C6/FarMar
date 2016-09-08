module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      all_products = {}
      CSV.read('support/products.csv').each do |line|
        all_products[line[0].to_i] = self.new(line[0].to_i, line[1], line[2].to_i)
      end
      return all_products
    end

    def self.find (id)
      products = self.all
      return products[id]
    end

    #self.by_vendor(vendor_id): returns all of the products with the given vendor_id
    def self.by_vendor(ven_id)
      products = self.all
      products_by_vendor = []

      products.each do | product_key, value |
        if value.vendor_id == ven_id
          products_by_vendor << value
        end
      end
      return products_by_vendor
    end


  end
end
