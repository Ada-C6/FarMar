module FarMar
  class Vendor
    attr_reader :id, :name, :number_of_employees, :market_id

    def initialize(id,name,number_of_employees,market_id)
      @id = id
      @name = name
      @number_of_employees = number_of_employees
      @market_id = market_id
    end

    # Returns a collection of instances, representing all of the objects described in the CSV
    def self.all
      vendors = {}
      CSV.read('support/vendors.csv').each do |line|
        vendor = self.new(line[0].to_i,line[1],line[2].to_i,line[3].to_i)
        vendors[vendor.id] = vendor
      end
      return vendors
    end

    # Returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
    def self.find(id)
      vendors = self.all
      return vendors[id]
    end

    # Returns the Market instance, associated with this vendor using the Vendor market_id field
    def market
      return @market_id
    end

    # Returns a collection of Product instances, associated by the Product vendor_id field.
    def products
      vendor_products = Product.all.select  { |product_id, product| product.vendor_id == id}
      return vendor_products
      # Refactor from the old method below (turns out select does return a hash when used on a hash):
      # vendor_products = {}
      # Product.all.each do |product_id, product|
      #   if product.vendor_id == id # finding id because it is an attr_reader
      #     vendor_products[product_id] = product # creates a hash of products carried by specific vendor
      #   end
      # end
      # return vendor_products
    end

    #Returns a collection of Sale instances, associated by the vendor_id field.
    def sales
      vendor_sales = Sale.all.select { |sale_id, sale|
        sale.vendor_id == id }
      return vendor_sales
      # Before refactoring:
      # vendor_sales = {}
      # Sale.all.each do |sale_id, sale|
      #   if sale.vendor_id == id
      #     vendor_sales[sale_id] = sale
      #   end
      # end #each
      # return vendor_sales
    end #def

    # Returns the the sum of all of the vendor's sales (in cents)
    def revenue
      revenue = 0
      sales.each do |sale_id, sale|
        revenue += (sale.amount) #in cents
      end
      return revenue
    end

    # Returns all of the vendors with the given market_ids
    def self.by_market(market_id) # nifty select method! returns only those that are true as an array though
      market_vendors = self.all.select { |vendor_id, vendor|
        vendor.market == market_id }
      return market_vendors # it is an array of hash
    end

  end


end
