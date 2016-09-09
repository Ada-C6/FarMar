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
    vendor_list = Vendor.all
    instances = vendor_list.find_all { |n| n[1].market_id == @id }

    vendor_instances = []
    instances.length.times do |i|
      vendor_instances << instances[i][1]
    end
    return vendor_instances
  end

  def products
    vendor_list = vendors # Vendors associated with market
    all_products = Product.all

    product_list = []

    # find Products that match Vendor ID associated with Market
    vendor_list.length.times do |i|
      p = all_products.find_all { |n| n[1].vendor_id == vendor_list[i].id}

      # add Product objects to product_list array
      p.length.times do |j|
        product_list << p[j][1]
      end
    end
    return product_list
  end

  def self.search(search_term)
    matches = []
    v = Vendor.all
    m = Market.all

    # find and add matching vendor names
    v_matches = v.find_all { |n| n[1].name.downcase.include?(search_term) }

    v_matches.each do |i|
      matches << i[1]
    end

    # find and add matching market names
    m_matches = m.find_all { |n| n[1].name.downcase.include?(search_term)}

    m_matches.each do |i|
      matches << i[1]
    end
    # matches << m_matches

    return matches
  end

  def prefered_vendor
    vendors.max_by { |n| n.revenue }
  end

end
