require 'csv'

module FarMar
  class Vendor
    attr_reader :id, :name, :market_id, :num_employees
    def initialize(id, name, num_employees, market_id)
      # ID - (Fixnum) uniquely identifies the vendor
      @id = id
      # Name - (String) the name of the vendor (not guaranteed unique)
      @name = name
      # No. of Employees - (Fixnum) How many employees the vendor has at the market
      @num_employees = num_employees
      # Market_id - (Fixnum) a reference to which market the vendor attends
      @market_id = market_id
    end

    def self.all
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      vendors = {}

      CSV.read("support/vendors.csv").each do |line|
        id, name, num_employees, market_id = line # parallel assignment!
        id = id.to_i # need id to be a fixnum
        num_employees = num_employees.to_i # want num_employees to be a fixnum also
        market_id = market_id.to_i #want market_id to be a fixnum

        vendors[id] = self.new(id, name, num_employees, market_id)
      end

      return vendors
    end

    def self.find(id)
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      all_vendors = self.all
      all_vendors[id]
    end

    def market
      #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
      # Return the market object that corresponds to the instance's market_id.
      Market.find(@market_id)
    end

    def self.by_market(market_id)
      # self.by_market(market_id): returns all of the vendors with the given market_id
      Vendor.all.values.group_by { |vendor| vendor.market_id }[market_id]
      #I don't like that these things are called the same thing -- I have an instance variable @market_id for a vendor instance, and the argument market_id that is getting passed in. Seems to be working though.
      #TODO: rather than using group_by and getting all the vendor groups by market_id, and then throwing away all the groups except the one I care about, research using "filter".
    end

    def products
      #products: returns an array of FarMar::Product instances that are associated by the FarMar::Product vendor_id field. Seems to be related to the Product.by_vendor(id), which returns all the products with a given vendor_id.
      Product.by_vendor(@id)
    end

    def sales
      #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
      # for this vendor object, I should get the list of products associated with it, then call product.sales for each of those products, which should return a collection of sales (probably as a hash, keyed off of product_id).
      sales_hash = {}

      products.each do |product| #for each product do the following.
        # it is possible for there to be no sales for a given product
        unless product.sales == nil
          sales_hash[product] = product.sales
        end
      end

      return sales_hash
    end

    def revenue
      #revenue: returns the the sum of all of the vendor's sales (in cents)
      #probably uses the #sales method, grabs the amount associated with each sale, and then reduces (:+) them to a sum?
      #sales returns a hash with key value pairs of product: [array of sales], so I'll want to iterate through each array of sales, grab the sale.amount, make a collection of those, and reduce them to the sum. Then for each product, I'll have a a total sale amount. (maybe use a map here), and I can then reduce again to get the total revenue.
      revenue_by_product = sales.map do |k, v|
        #v is an array of sales
        #want to get an array of sale.amounts for it.
        amounts = []
        v.each do |sale|
          amounts << sale.amount
        end

        # taking the array of sale.amounts, I'm going to reduce to get revenue for this product. The result should be an array of revenues per product. (number of amounts in this array should equal the same number of products for the vendor where there have been a sale.)
        # at some point in the future, I might want to keep the product as the key, but for right now I don't think I care.
        amounts.reduce(:+)
      end

      revenue_by_product.reduce(:+)
    end
  end
end
