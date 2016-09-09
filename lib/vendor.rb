# require 'csv'
# require_relative 'market'
# require_relative 'product'
# require_relative 'sale'
module FarMar
  class Vendor

    attr_reader :id, :name, :no_of_employee, :market_id, :market_info
    #, :sale_info

    def initialize (id, name, no_of_employee, market_id)
      @id = id
      @name = name
      @no_of_employee = no_of_employee
      @market_id = market_id
      @market_info = []
      # @product_info = []
      # @sale_info = []
    end

    def self.all
      info = {}
      # CSV.read('../support/vendors.csv').each do |line|
        CSV.read('support/vendors.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        no_of_employee = line[2].to_i
        market_id = line[3].to_i
        info[id] = self.new(id, name, no_of_employee, market_id)
      end
      return info
    end

    def self.find(id)
      self.all[id]
    end

    def market
      markets = FarMar::Market.all
      markets.each do |key, line|
        if @market_id == line.id
          @market_info << line
        end
      end
      return @market_info
    end

    def products
      product_info = FarMar::Product.by_vendor(@id)
      return product_info
    end

    def sales
      sale_info = []
      sale = FarMar::Sale.all
      sale.each do |key, line|
        if @id == line.vendor_id
          sale_info << line
        end
      end
      return sale_info
    end

    def self.by_market(market_id)
      vendor_info = []
      vendors = Vendor.all

      vendors.each do |key, line|
        if market_id == line.market_id
          puts  vendor_info << line
        end
      end
      return vendor_info
    end

    def revenue
      sum = 0
      total = sales.inject(0){|sum, line| sum + line.amount}
      return total
    end
  end
end

# p FarMar::Vendor.by_market(2)
# p = FarMar::Vendor.new(1, "name", 123, 1)
# p p.revenue
# p p.market
# p p.products
# p p.sales

# p FarMar::Vendor.all
