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
    v = Vendor.all
    return v[id]
  end

  def market
    Market.find(@market_id)
  end

  def products
    product_list = Product.all
    match = product_list.find_all { |n| n[1].vendor_id == @id }
    product_instances = []
    match.length.times do |i|
      product_instances << match[i][1]
    end
    return product_instances
  end

  def sales
    sales_list = Sale.all
    match = sales_list.find_all { |n| n[1].vendor_id == @id }
    sales_instances = []
    match.length.times do |i|
      sales_instances << match[i][1]
    end
    return sales_instances
  end

  def revenue
    total_revenue = 0
    sales_instances = sales
    sales_instances.each do |i|
      total_revenue += i.amount
    end
    return total_revenue
  end

  def self.by_market(market_id)
    a = all.find_all { |n| n[1].market_id == market_id }

    vendors_by_market = []
    a.length.times do |i|
      vendors_by_market << a[i][1]
    end
    return vendors_by_market
  end
end
