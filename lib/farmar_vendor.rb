# lib/farmar_vendor.rb
# require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :market_id, :name
  def initialize(id, name, employees_num, market_id)
    @id = id
    @name = name
    @employees_num = employees_num
    @market_id = market_id
  end

  # load vendor infomation from vendor csv file
  # input: csv file name (optional)
  # output: an array of class vendor objects
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
  # input: vendor id (string)
  # output: an vendor object that corresponds to the given vendor id
  def self.find(id)
    found_vendor = nil
    all.each do |vendor|
      if id == vendor.id
        found_vendor = vendor
        break
      end
    end
    return found_vendor
  end

  # returns all of the FarMar::Vendor objects with the given market_id
  def self.by_market(market_id)
    return self.all.select {|vendor| vendor.market_id == market_id }
  end

  # find market information by market_id
  # output: an array of FarMar::Market objects that are associated with the market_id
  def market
    return FarMar::Market.find(@market_id)
  end

  # return an array of FarMar::Vendor objects that are associated with the vendor_id
  def products
    return FarMar::Product.all.select { |product| product.vendor_id == @id }
  end

  # return an array of FarMar::Sale objects that are associated with the vendor_id
  def sales
    return FarMar::Sale.find_by_vendor_id(@id)
  end

  # returns the sum of all of the vendor's sales in cents(a float)
  def revenue
      # returns an array of the vendor's sale amount
    amounts = self.sales.map {|sale| sale.amount}
    # add up the sale amount and return the sum
    return amounts.inject(0.0) {|sum, amount| sum + amount}
  end
end
