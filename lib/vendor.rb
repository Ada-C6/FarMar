module FarMar
  class Vendor
    attr_reader :id, :name, :number_of_employees, :market_id

    def initialize(id,name,number_of_employees,market_id)
      @id = id
      @name = name
      @number_of_employees = number_of_employees
      @market_id = market_id
    end

    def self.all
      vendors = {}
      CSV.read('support/vendors.csv').each do |line|
        vendor = self.new(line[0].to_i,line[1],line[2].to_i,line[3].to_i)
        vendors[vendor.id] = vendor
      end
      return vendors
    end

    def self.find(id)
      vendors = self.all
      return vendors[id]
    end

    def market
      return @market_id
    end

    def products
      vendor_products = {}
      Product.all.each { |product_id, product|
        if product.vendor_id == id
          vendor_products[product_id] = product # creates a hash of products carried by specific vendor
        end
      }
      return vendor_products
    end

# #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  # def sales
  #   vendor_sales = {}
  #   Sale.all.each do |sale_id, sale|
  #     if sale.vendor_id == id
  #       vendor_sales[sale_id] = sale
  #     end
  #   end
  # end

  end


end
