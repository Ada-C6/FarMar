require 'CSV'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id.to_i
      @name = name.to_s
      @num_employees = num_employees.to_i
      @market_id = market_id.to_i
    end

    def self.all
      vendors_hash = {}
      CSV.read("./support/vendors.csv").each do |line|
        id = line[0].to_i
        name = line[1]
        num_employees = line[2].to_i
        market_id = line[3].to_i
        vendors_hash[id] = self.new(id, name, num_employees, market_id)
      end
      return vendors_hash
    end

    def self.find(id)
      return self.all[id]
    end

    def market
      all_markets = FarMar::Market.all
      all_markets.select do |market, value|
        @market_id == value.id
        return value
      end
    end

    def products
      all_products = FarMar::Product.all
      vendors_products = []
      all_products.each do |product, product_values|
        if product_values.vendor_id == @id
          vendors_products << product_values
        end
      end
      return vendors_products
    end

    def sales
      all_sales = FarMar::Sale.all
      vendor_sales =[]
      all_sales.each do |sale, sale_values|
        if sale_values.vendor_id == @id
          vendor_sales << sale_values
        end
      end
      return vendor_sales
    end

    def revenue #trying reduce
      vendor_sales = self.sales #returns an array of sales for vendor
      # in parentheses, total_revenue = 0
      vendor_sales.inject(0) do |total_revenue, sale|
        total_revenue + sale.amount
      end
    end

    def self.by_market(a_market_id)
      all_vendors = self.all #returns hash of all vendors
      vendors_list = []
      all_vendors.each do |vendor_key, vendor_value|
        if  vendor_value.market_id == a_market_id
          vendors_list << vendor_value
        end
      end
      return vendors_list
    end
  end #end class
end #end module
