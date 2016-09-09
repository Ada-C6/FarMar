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

    def vendor
      product_vendor = Vendor.new(:id, :name, :number_of_employees, :market_id)
      Vendor.all.each do |ven_id, ven|
        if ven_id == vendor_id
          product_vendor = ven
          break
        end
      end
      return product_vendor
    end
    # Returns a collection of Sale instances, associated using the Sale product_id field.
    def sales
      product_sales = {}
      Sale.all.each do |sale_id, sale|
        if sale.product_id == id
          product_sales[sale_id] = sale
        end
      end
      return product_sales
    end

    #Returns the number of times this product has been sold.
    def number_of_sales
      return sales.length
    end

    #Returns all of the products with the given vendor_id
    def self.by_vendor(ven_id)
      vendor_products = {}
      self.all.each do |pro_id, pro|
        if ven_id == pro.vendor_id
          vendor_products[pro_id] = pro
        end
      end
        return vendor_products
    end


  end
end
