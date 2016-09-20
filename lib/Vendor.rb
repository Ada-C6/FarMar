class FarMar::Vendor 

  attr_reader :id, :vendor_name, :employee_count, :market_id

  def initialize(id, vendor_name, employee_count, market_id)

    @id = id
    @vendor_name = vendor_name
    @employee_count = employee_count
    @market_id = market_id
    #WRONG! # should not have to enter market_id here

  end
  # returns an array of Vendors
  def self.all

    vendor_array = []

    CSV.foreach('./support/vendors.csv') do |line|
      id = line[0]
      vendor_name = line[1]
      employee_count = line[2]
      market_id = line[3]

      vendor_array << FarMar::Vendor.new(id, vendor_name, employee_count, market_id)
    end
    return vendor_array
  end

  def self.find(id)

    found_vendor = nil

    all.each do |vendor|
      if vendor.id == id
        found_vendor = vendor
        break
      end
    end
    return found_vendor
  end

  #this method returns an instance of market that matches this vendors market_id
  def get_market 
    found_market = FarMar::Market.find(@market_id)
    return found_market
  end

  def get_products

    found_products = []

    FarMar::Product.all.each do |product|
      if product.vendor_id == @id
        found_products.push(product)
      end
    end
    return found_products
  end

  def get_sales

    found_sales = []
    FarMar::Sale.all.each do |sale|
      if sale.vendor_id == @id
        found_sales.push(sale)
      end
    end
    return found_sales
  end

  def get_revenue 
    found_sales = get_sales
    sum_revenue = 0
    found_sales.each do |sale|
      sum_revenue += sale.sale_amount.to_f
    end
    return sum_revenue
  end

  def self.by_market(market_id)
    found_vendors = []

    all.each do |vendor|
      if vendor.market_id == market_id
        found_vendors.push(vendor)
      end
    end
    return found_vendors
  end 
end



# testing content moved to far_mar.rb