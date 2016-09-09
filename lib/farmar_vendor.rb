require 'csv'

class Vendor
  attr_reader :id, :name, :employees, :market_id

  def initialize(id, name, employees, market_id)
    @id = id
    @name = name
    @employees = employees
    @market_id = market_id
  end

  def self.all
    vendors = {}
    CSV.read('support/vendors.csv').each do |line|
      id = line[0].to_i
      name = line[1]
      employees = line[2].to_i
      market_id = line[3].to_i

      vendors[id] = self.new(id, name, employees, market_id)
    end
    return vendors
  end

  def self.find(id)
    return all[id]
  end

  def market
    Market.find(@market_id)
  end

  def products
    product_list = Product.all.values
    product_instances = []
    product_instances << product_list.find_all { |n| n.vendor_id == @id }

    return product_instances.flatten
  end

  def sales
    sales_list = Sale.all.values
    sales_instances = []
    sales_instances << sales_list.find_all { |n| n.vendor_id == @id }

    return sales_instances.flatten
  end

  def revenue
    total_revenue = 0
    sales.each do |i|
      total_revenue += i.amount
    end
    
    return total_revenue
  end

  def self.by_market(market_id)
    vendors_by_market = []
    vendors_by_market << all.values.find_all { |n| n.market_id == market_id }

    return vendors_by_market.flatten
  end
end
