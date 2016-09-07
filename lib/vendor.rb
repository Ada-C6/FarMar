require 'csv'

module FarMar
  class Vendor
    attr_reader :id, :name, :num_empls, :market_id

    def initialize(id, name, num_empls, market_id)
      @id = id
      @name = name
      @num_empls = num_empls
      @market_id = market_id
    end

    def self.all
      all_vendors = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/vendors.csv").each do |line|
        all_vendors[line[0].to_i] = self.new(line[0].to_i,line[1],line[2].to_i,line[3].to_i)
      end
      return all_vendors
    end

    def self.find(id)
      # all_vendors = self.all

      if all.has_key?(id)
        return all[id]
      else
        raise ArgumentError.new("We do not have a vendor with that ID.")
      end
    end

    def self.by_market(market_id)
      all.delete_if do |k, v|
        v.market_id != market_id
      end
    end

    def market
      all_markets = FarMar::Market.all
      return all_markets[@id]
    end

    def products
      all_products = FarMar::Product.all

      all_products.delete_if do |k, v|
        v.vendor_id != @id
      end

      return all_products
    end

    def sales
      all_sales = FarMar::Sale.all

      all_sales.delete_if do |k, v|
        v.vendor_id != @id
      end

      return all_sales
    end

    def revenue
      sales_amounts = sales.map do |k, v|
        v.amount
      end

      sales_amounts.reduce(:+)
    end

  end
end
