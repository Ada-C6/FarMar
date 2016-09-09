
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
        product_array[i] = self.new(line[0].to_i, line[1], line[2].to_i)
      end
      return product_array
    end

    def self.find(id)
      raise ArgumentError.new("invalid input type") unless id.is_a? (Fixnum)
      all_products = FarMar::Product.all
      all_products.each do |product|
        if product.id == id
          return product
        end
      end
    end

    def vendor # returns the Vendor instance that is associated with a Product instance
      FarMar::Vendor.find(@vendor_id)
    end

    def sales # returns a collection of Sale instances that are associated with a Product instance
      product_sales_array = []
      product_sales_array = FarMar::Sale.all
      product_sales_array.map do |sale|
        if sale.product_id == @id
          product_sales_array << sale
        end
      end
      return product_sales_array
    end

    def number_of_sales # returns the number of times this product has been sold
      # get a collection of ALL sale instances
      # iterate over them and find the ones with product ids that match the product id of the product instance the method is called on
      # find the length of the array. That's the number of times a product has been sold
      a_products_sales = []
      all_sales = FarMar::Sale.all
      all_sales.each do |sale|
        if sale.product_id == @id
          a_products_sales << sale
        end
      end
      return a_products_sales.length
    end

    def self.by_vendor(vendor_id) # returns all of the products with the given vendor_id
      #iterate over an array of all products
      #if a products vendor_id matches the vendor_id passed in then shovel into a separate array
      vendor_products = []
      all_products = FarMar::Product.all
      all_products.map do |product|
        if product.vendor_id == vendor_id
          vendor_products << product
        end
      return vendor_products
      end
    end




















  end
end
