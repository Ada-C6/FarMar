# lib/farmar_market.rb
# require_relative '../far_mar'

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

  # load market infomation from market csv file
  # input: csv file name (optional)
  # output: an array of class Market objects
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

  # identify market information by market id
  # input: market id (string)
  # output: an market object that corresponds to the given market id
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

  # returns the Vendor object with the highest revenue
  def prefered_vendor
    #return an array Vendor objects sorted by vendor revenue in accending order
    revenues = FarMar::Vendor.all.sort_by { |vendor| vendor.revenue }
    # return the vendor that has the highest revenue(the last element in the array)
    return revenues.last
  end


end
