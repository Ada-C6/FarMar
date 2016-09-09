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

    def self.by_vendor(vendor_id)
      products_for_this_vendor = []
      Product.all.each do |p|
        if vendor_id == p.vendor_id
          products_for_this_vendor << p.name
        end
      end
      return products_for_this_vendor
    end

    def vendor
      FarMar::Vendor.all.each do |v|
        if @vendor_id == v.id
          return v
        end
      end
    end

    def sales
      @this_products_sales = []
      FarMar::Sale.all.each do |s|
        if @id == s.product_id
          @this_products_sales << s.id
        end
      end
      return @this_products_sales
    end

    def number_of_sales
      sales
      return @this_products_sales.length
    end

  end
end
