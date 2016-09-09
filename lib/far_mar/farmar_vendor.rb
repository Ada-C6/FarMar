# lib/farmar_vendor.rb
# require_relative '../far_mar'

class FarMar::Vendor < Finder
  attr_reader :id, :market_id, :name
  def initialize(id, name, employees_num, market_id)
    @id = id
    @name = name
    @employees_num = employees_num
    @market_id = market_id
  end

  # load vendor infomation from vendor csv file
  # return an array of class vendor objects
  def self.all
    if @vendors != nil
      return @vendors
    end

    vendor_csv_file = "/Users/mengyao/ADA_class/FarMar/support/vendors.csv"

    vendors = []
    CSV.foreach(vendor_csv_file) do |row|
      id = row[0].to_s
      name = row[1].to_s
      employees_num =row[2].to_s
      market_id = row[3].to_s

      vendors << FarMar::Vendor.new(id, name, employees_num, market_id)
    end
    @vendors = vendors
    return @vendors
  end

  # identify vendor information by vendor id
  # return an vendor object that corresponds to the given vendor id
  # def self.find(id)
  #   found_vendor = nil
  #   all.each do |vendor|
  #     if id == vendor.id
  #       found_vendor = vendor
  #       break
  #     end
  #   end
  #   return found_vendor
  # end

  # return all of the FarMar::Vendor objects with the given market_id
  def self.by_market(market_id)
    return self.all.select {|vendor| vendor.market_id == market_id }
  end

  # return an array of the top n Vendor objects ranked by total revenue
  def self.most_revenue(n)
    # get an array of vendors sorted by revenue in descending order
    vendors_by_revenue = FarMar::Vendor.all.sort_by {|vendor| vendor.revenue}.reverse
    # get the top n Vendor objecthighest revenue
    return vendors_by_revenue.slice(0...n)
  end

  # returns the top n vendor instances ranked by total number of items sold
  def self.most_items(n)
    # get an array of vendors sorted by number of item sold in descending order
    vendors_by_revenue = FarMar::Vendor.all.sort_by {|vendor| FarMar::Sale.find_by_vendor_id(vendor.id).size}.reverse
    # get the top n Vendor objecthighest revenue
    return vendors_by_revenue.slice(0...n)
  end

  # returns the total revenue for that date across all vendors
  def self.revenue(date)
    beginning_time, end_time = Utils.get_day_range(date)
    # return an array of Sale objects in the given date
    sales = FarMar::Sale.between(beginning_time, end_time)

    # add up the sale amount and return the sum
    return sales.inject(0.0) {|sum, sale| sum + sale.amount}
  end

  # return an array of FarMar::Market objects that are associated with the market_id
  def market
    return FarMar::Market.find(@market_id)
  end

  # return an array of FarMar::Product objects that are associated with the vendor_id
  def products
    return FarMar::Product.all.select { |product| product.vendor_id == @id }
  end

  # return an array of FarMar::Sale objects that are associated with the vendor_id
  def sales
    return FarMar::Sale.find_by_vendor_id(@id)
  end

  # returns the sum of all of the vendor's sales in cents(a float)
  def revenue_all_sales
    # add up the sale amount and return the sum
    return self.sales.inject(0.0) {|sum, sale| sum + sale.amount}
  end

  # returns the total revenue for that specific purchase date and Vendor object
  def revenue(date = nil)
    if date == nil
      return revenue_all_sales
    end
    beginning_time, end_time = Utils.get_day_range(date)
    # get an array of Sale objects in the given date
    sales = FarMar::Sale.between(beginning_time, end_time)
    # get an array of Sale objects by this vendor in the given date
    sales = sales.select { |sale| sale.vendor_id == @id }
    # add up the sale amount and return the sum
    return sales.inject(0.0) {|sum, sale| sum + sale.amount}
  end

end
