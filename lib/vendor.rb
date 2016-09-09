module FarMar
  class Vendor
    attr_reader :id, :name, :num_of_employees, :market_id, :revenue_from_sales

    def initialize(id, name, num_of_employees, market_id)
      @id = id
      @name = name
      @num_of_employees = num_of_employees
      @market_id = market_id
    end

    def self.all
      all_vendors = {}
      CSV.read('support/vendors.csv').each do | line |
        all_vendors[line[0].to_i] = self.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
      end
      return all_vendors
    end

    def self.find(id)
      vendors = self.all
      return vendors[id]
    end

    def self.by_market(id)
      all_vendors = self.all
      vendors_by_market = []

      #key is vendor_id and the value is the vendor object
      all_vendors.each do | vendor_key, value|
        if value.market_id == id
          vendors_by_market << value
        end
      end
      #returns all of the vendors with the given market_id
      return vendors_by_market
    end

    #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor.market_id field
    def market
      FarMar::Market.find(@market_id)
    end

    def products
      FarMar::Product.by_vendor(@id)
    end

    #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    # def sales
    #   @sales_by_vendor = {}
    #
    #   products.each do | product |
    #     if product.sales && product.sales.any?
    #       @sales_by_vendor[product.id] = product.sales
    #     end
    #   end
    #   return @sales_by_vendor
    # end
    #
    # def revenue
    #   sales
    #   revenue_by_product = @sales_by_vendor.map do |k, v|
    #     all_sales = []
    #     v.each do | sale |
    #        all_sales << sale.amount
    #     end
    #     all_sales.reduce(:+)
    #   end
    #   @revenue_from_sales = revenue_by_product.reduce(:+)
    #   return @revenue_from_sales
    # end

    
    def sales
      sales_by_vendor = []
      @all_sales ||= FarMar::Sale.all
      @all_sales.each do | sales_key, sale_value |
        if sale_value.vendor_id == @id
          sales_by_vendor << sale_value
        end
      end
      return sales_by_vendor
    end

    def revenue
      @revenue_from_sales = 0
      @sales_by_vendor ||= sales
      @sales_by_vendor.each do | sales_value |
        @revenue_from_sales += sales_value.amount
      end
      return @revenue_from_sales
    end

    # should return the top n vendor instances ranked by total revenue
    def self.most_revenue(n)
      all_vendors = self.all
      all_vendors.each do | key, value |
        value.revenue
      end

      puts "---------"
      highest = all_vendors.sort_by { | value | value.revenue_from_sales }
      puts highest

      # highest.reverse
      # return highest.take(n)
    end
  end
end
