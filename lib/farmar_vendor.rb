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

    # def self.find_by_name(name)
    #   self.all.each do |vendor|
    #     vendor.name.upcase == name.upcase
    #   end
    # end

    def market
      FarMar::Market.find(@market_id)
    end

    def products
      FarMar::Product.all.select do |product|
        product.vendor_id == @id
      end
    end

    def sales
      FarMar::Sale.all.select do |sale|
        sale.vendor_id == @id
      end
    end

    def revenue(date = nil)
      vendor_sales = sales
      if date != nil
        beginning_time = DateTime.new(date.year, date.month, date.day, 0, 0, 0, '-8')
        end_time = DateTime.new(date.year, date.month, date.day, 23, 59, 59, '-8')

        vendor_sales_by_date = vendor_sales.select do |sale|
          sale.purchase_time > beginning_time && sale.purchase_time < end_time
        end

        vendor_sales = vendor_sales_by_date
      end

      revenue = 0
      vendor_sales.each do |sale|
        revenue += sale.amount
      end

      # revenue_total = revenue_array.reduce(:+)

      if revenue == nil
        return 0
      else
        return revenue
      end
    end

    # def self.most_revenue(n)
    #   vendors_by_revenue = self.all.sort_by do |vendor|
    #     vendor.revenue
    #   end
    #   return vendors_by_revenue[-n..-1]
    # end

    def self.by_market(market_id)
      self.all.select do |vendor|
        vendor.market_id == market_id
      end
    end

  end
end
