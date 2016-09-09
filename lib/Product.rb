require 'CSV'

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name.to_s
      @vendor_id = vendor_id.to_i
    end

    def self.all
      products_hash = {}
      CSV.read("./support/products.csv").each do |line|
        id = line[0].to_i
        name = line[1]
        vendor_id = line[2].to_i
        products_hash[id] = self.new(id, name, vendor_id)
      end
      return products_hash
    end

    def self.find(id)
      if id.is_a?Fixnum
        return self.all[id]
      else
      raise ArgumentError.new("Must pass a valid ID number")
      end
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor_key, vendor_values|
        if @vendor_id == vendor_values.id
          return vendor_values
        end
      end
    end

    def sales #using select method
      all_sales = FarMar::Sale.all
      all_sales.select do |sale_key, sale_values|
        @id == sale_values.product_id
      end
    end

    def number_of_sales
      product_sales = self.sales
      return product_sales.length
    end

    def self.by_vendor(a_vendor_id)
      all_products = self.all
      # products_by_vendor = []
      all_products.select do |product, product_values|
        product_values.vendor_id == a_vendor_id
      end
    end
  end #end class
end #end module
