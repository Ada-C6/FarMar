# lib/farmar_market.rb
# require_relative '../far_mar'
require 'date'

class FarMar::Market
  attr_reader :id, :name
  def initialize(id, name, address, city, county, state, zip)
     @id = id
     @name = name
     @address = address
     @city = city
     @county = county
     @state = state
     @zip = zip
  end


  # return an array of class Market objects
  def self.all
    market_csv_file = "/Users/mengyao/ADA_class/FarMar/support/markets.csv"

    markets = []
    CSV.foreach(market_csv_file) do |row|
      id = row[0].to_s
      name = row[1].to_s
      address =row[2].to_s
      city = row[3].to_s
      county = row[4].to_s
      state = row[5].to_s
      zip = row[6].to_s
      markets << FarMar::Market.new(id, name, address, city, county, state, zip)
    end
    return markets
  end

  # return an Market object that corresponds to the given market id
  def self.find(id)
    found_market = nil
    all.each do |market|
      if id == market.id
        found_market = market
        break
      end
    end
    return found_market
  end


  # returns an array of FarMar::Market objects where the market name or vendor name contain the search_term
  def self.search(search_term)
    term = search_term.downcase
    # return an array of Market objects found with the matched market name or vendor name
    return FarMar::Market.all.select do |market|
      # a Market obejct's market name
      market_name = market.name
      # a Market object's associated (an array of) Vendor objects
      vendors = FarMar::Vendor.by_market(market.id)
      # get an array of each Vendor objects' vendor name
      vendor_names = vendors.map!{|vendor| vendor.name}
      # find search_term in market name(a string) and in each vendor name in an array of vendor names string
      market_name.downcase.include?(term) || vendor_names.any?{ |vendor_name| vendor_name.downcase.include?(term) }
    end
  end

  # return an array of FarMar::Vendor objects that are associated with the market by the market_id field
  def vendors
    return FarMar::Vendor.all.select { |vendor| @id == vendor.market_id }
  end

  # returns an array of FarMar::Product objects that are associated to the market through the FarMar::Vendor class.
  # In another word, input a market_id and return the Product objects that associated with that market_id.
  def products(market_id)
    # give a market_id, return an array of its associated Vendor objects
    vendors = FarMar::Vendor.by_market(market_id)
    # get an array of each vendor's vendor_id
    vendor_ids = vendors.map {|vendor| vendor.id }
    # iterate over all vendor_ids. for each vendor_id, return Product objects that associated with this vendor_id.
    return vendor_ids.map do |vendor_id|
      FarMar::Product.all.select { |product| product.vendor_id == vendor_id }
    end
  end

  # returns the Vendor object with the highest revenue among a group of vendors
  def prefered_vendor_direct(vendors)
    # vendors => FarMar::Vendor.all can put this in method call
    #return an array Vendor objects sorted by vendor revenue in accending order
    revenues =  vendors.sort_by { |vendor| vendor.revenue }
    # return the vendor that has the highest revenue(the last element in the array)
    return revenues.last
  end

  # returns the Vendor object with the highest revenue for the given date
  def prefered_vendor(date)
    # Assume the date will be given a string in "year-month-day" format
    beginning_time = Date.parse(date).to_datetime.to_s
    end_time = Date.parse(date).next.to_datetime.to_s
    # return an array of Sale objects in the given date
    sales = FarMar::Sale.between(beginning_time, end_time)
    # return an array of Vendors associated with the Sale objects
    vendors = sales.map{|sale| sale.vendor}
    # return the prefered vendor associate with the Sale object on that date
    return self.prefered_vendor_direct(vendors)
  end
    # OPTIMZE vendors = sales.map{|sale| sale.vendor}, it takes 0m9.898s to test.

  def worst_vendor_direct(vendors)
    # vendors => FarMar::Vendor.all can put this in method call
    #return an array Vendor objects sorted by vendor revenue in accending order
    revenues =  vendors.sort_by { |vendor| vendor.revenue }
    # return the vendor that has the lowest revenue(the last element in the array)
    return revenues.first
  end

  def worst_vendor(date)
    # Assume the date will be given a string in "year-month-day" format
    beginning_time = Date.parse(date).to_datetime.to_s
    end_time = Date.parse(date).next.to_datetime.to_s
    # return an array of Sale objects in the given date
    sales = FarMar::Sale.between(beginning_time, end_time)
    # return an array of Vendors associated with the Sale objects
    vendors = sales.map{|sale| sale.vendor}
    # return the prefered vendor associate with the Sale object on that date
    return self.worst_vendor_direct(vendors)
  end
    # DRY the above two methods. They are repetitive of the prefered_vendor methods.

end
