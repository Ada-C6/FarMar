module FarMar
  class Product
    attr_reader :id, :name, :vendor_id
    def initialize(id,name,vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    # Returns a collection of instances, representing all of the objects described in the CSV
    def self.all
      products = {}
      CSV.read('support/products.csv').each do |line|
        product = self.new(line[0].to_i,line[1],line[2].to_i)
        products[product.id] = product
      end
      return products
    end

    # Returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
    def self.find(id)
      products = self.all
      return products[id]
    end

    #  Returns the Vendor instance, associated with this vendor using the Product vendor_id field
    def vendor
      product_vendor_array = Vendor.all.find { |ven_id, ven|
        ven_id == vendor_id }
        product_vendor = product_vendor_array[1] # second element in find array
      return product_vendor # vendor object

      # Refactoring:
      # product_vendor = Vendor.new(:id, :name, :number_of_employees, :market_id)
      # Vendor.all.each do |ven_id, ven|
      #   if ven_id == vendor_id
      #     product_vendor = ven
      #     break
      #   end
      # end
      # return product_vendor # vendor object, not hash
    end

    # Returns a collection of Sale instances, associated using the Sale product_id field.
    def sales
      product_sales = Sale.all.select { |sale_id, sale|
        sale.product_id == id }
      return product_sales

      # Refactoring:
      # product_sales = {}
      # Sale.all.each do |sale_id, sale|
      #   if sale.product_id == id
      #     product_sales[sale_id] = sale
      #   end
      # end
      # return product_sales
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
