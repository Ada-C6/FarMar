module FarMar

  class Product
    @@all_products_by_vendor = nil
    @@all_products = nil
    attr_accessor :product_id, :name, :vendor_id
      def initialize(product_id, name, vendor_id)
        @product_id = product_id
        @name = name
        @vendor_id = vendor_id
      end

      #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  #number_of_sales: returns the number of times this product has been sold.
  #self.by_vendor(vendor_id): returns all of the products with the given vendor_id

        ##find vendors of product
      def vendors
        return Vendor.find(@vendor_id)
      end

        ##create all product instances from csv
      def self.all
        if @@all_products == nil
          products = { }
            CSV.read('./support/products.csv').each do |line|
              products[line[0]] = Product.new(line[0], line[1], line [2])
            end
            @@all_products = products
        end
        return @@all_products
      end

        ##find product by its own id
      def self.find(product_id)
          Product.all[product_id]
      end

        ##find products of a vendor (all vendors by market << all products by vendor)
      def self.by_vendor(vendor_id)
        if @@all_products_by_vendor == nil
          products = { }
          Product.all.each do |product_id, current_product|
            if products[current_product.product_id] == nil
              products[current_product.product_id]  = { }
            end
            products[current_product.vendor_id][current_product.product_id] = current_product
          end
          @@all_products_by_vendor = products
        end
        return @@all_products_by_vendor[vendor_id]
      end
  end
end
