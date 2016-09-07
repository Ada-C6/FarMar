module FarMar
  class Vendor
    attr_reader :id, :name, :market_id

    def initialize(id, name, employee_count, market_id)
      @id = id.to_i
      @name = name
      @employee_count = employee_count.to_i
      @market_id = market_id.to_i
    end

    def self.all
      all_vendors = []
      CSV.read('support/vendors.csv').each do |line|
        all_vendors << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
      return all_vendors
    end

    def self.find(id)
      all_vendors = self.all
      all_vendors.each do |vendor|
        if vendor.id == id
          return vendor
        end
      end
    end

    def market
      FarMar::Market.find(@market_id)
    end

    def products
      all_products = FarMar::Product.all
      vendor_products = []
      all_products.each do |product|
        if product.vendor_id == @id
          vendor_products << product
        end
      end
      return vendor_products
    end

    def sales
      all_sales = FarMar::Sale.all
      vendor_sales = []
      all_sales.each do |sale|
        if sale.vendor_id == @id
          vendor_sales << sale
        end
      end
      return vendor_sales
    end

    def revenue
      vendor_sales = sales
      revenue_array = vendor_sales.map do |sale|
        sale.amount
      end
      revenue_total = revenue_array.reduce(:+)
      return revenue_total
    end

    def self.by_market(market_id)
      all_vendors = self.all
      all_vendors.select do |vendor|
        vendor.market_id == market_id
      end
    end

  end
end
