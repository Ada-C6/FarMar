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

    #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product.vendor_id field
    def vendor
      FarMar::Vendor.find(@vendor_id)
    end

    #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale.product_id field.
    def sales
      sales_by_product_id = []
      all_sales = FarMar::Sale.all

      all_sales.each do |sale_key, sale_value|
        if sale_value.product_id == @id
          sales_by_product_id << sale_value
        end
      end
      return sales_by_product_id
    end

    # number_of_sales: returns the number of times this product has been sold.
    def number_of_sales
      return sales.length
    end
  end
end
