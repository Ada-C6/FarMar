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
      return self.all[id]
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor_key, vendor_values|
        if @vendor_id == vendor_values.id
          return vendor_values
        end
      end
    end

    def sales
      #get all sales
      #find and pull out the sales that share the same product id
      all_sales = FarMar::Sale.all
      product_sales = []
      all_sales.each do |sale_key, sale_values|
        if @id == sale_values.product_id
          product_sales << sale_key
        end
      end
      return product_sales 
    end #end sales method

  end #end class
end #end module
