module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      list_of_products = []
      CSV.read("/Users/YNaka/Ada/project_forks/FarMar/support/products.csv", "r").each do |line|
        list_of_products << self.new(line[0].to_i, line[1], line[2].to_i)
      end
      list_of_products
    end

    def self.find(product_id)
      Product.all.each do |p|
        if product_id == p.id
          return p
        end
      end
      return "That is not an existing product ID"
    end

    def vendor
      FarMar::Vendor.all.each do |v|
        if @vendor_id == v.id
          return v
        end
      end
    end

  end
end
