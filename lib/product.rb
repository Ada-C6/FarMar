require 'csv'

module FarMar
  class Product
    attr_reader :id, :product, :vendor_id

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
      if all.has_key?(id)
        return all[id]
      else
        raise ArgumentError.new("We do not have a product with that ID.")
      end
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      return all_vendors[@id]
    end

    def sales
      all_sales = FarMar::Sale.all

      all_sales.delete_if do |k, v|
        v.product_id != @id
      end

      return all_sales
    end

    def number_of_sales
      return sales.length
    end
  end
end
