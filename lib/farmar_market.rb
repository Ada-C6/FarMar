require 'csv'

class Market

  attr_reader :id, :name, :city, :county, :state, :zip

  def initialize(id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    markets = {}
    CSV.read('support/markets.csv').each do |line|
      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6]

      markets[id] = self.new(id, name, address, city, county, state, zip)
    end
    return markets
  end

  def self.find(id)
    market = Market.all
    return market[id]
  end

  def vendors
    vendor_list = Vendor.all.values
    vendor_list.find_all { |n| n.market_id == @id }
  end

  def products
    vendor_list = vendors # Vendors associated with Market instance
    all_products = Product.all.values

    product_list = []

    vendor_list.each do |i|
      product_list << all_products.find_all { |n| n.vendor_id == i.id }
    end

    return product_list.flatten
  end

  def self.search(search_term)
    matches = []
    v = Vendor.all.values
    m = Market.all.values

    # find matching vendor names
    vendors = []
    vendors << v.find_all { |n| n.name.downcase.include?(search_term) }
    # find and add associated market
    vendors.flatten.each do |i|
      matches << i.market
    end

    # find and add matching market names
    matches << m.find_all { |n| n.name.downcase.include?(search_term)}

    return matches.flatten
  end

  def prefered_vendor
    vendors.max_by { |n| n.revenue }
  end

  # IN PROGRESS:
  # def prefered_vendor(date)
  #   date = DateTime.parse(date)
  #   vendor_list = vendors
  #
  #   beginning_time = date.to_date
  #   end_time = beginning_time + 1
  #
  #   sales = Sale.between(beginning_time, end_time)
  #
  #   market_sales = []
  #
  #   sales.each do |i|
  #     if vendor_list.include?(i.vendor_id)
  #       market_sales << i
  #     end
  #   end
  #   return market_sales.max_by { |n| n.revenue }
  # end

end
