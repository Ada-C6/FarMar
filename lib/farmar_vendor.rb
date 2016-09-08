class FarMar::Vendor
  attr_reader :vend_id, :name, :num, :market_id
  def initialize(id, name, num, market_id)
    @vend_id = id
    @name = name
    @empl_num = num
    @market_id = market_id
  end

  def self.all
    vendors = {}
    farm_vend = []
    CSV.open('support/vendors.csv', 'r').each do |vend|
      vendors[vend[0]] = vend[1..3]
      id = vend[0].to_i
      name = vend[1]
      num = vend[2]
      market_id = vend[3].to_i
      farm_vend << self.new(id, name, num, market_id)
    end
    return farm_vend
  end

  def self.find(id)
    find_id = self.all
    find_id.each do |i|
      if i.vend_id == id
        return i
      end
    end
  end
  def self.by_market(market_id)

    vend_search = self.all
    vend_search.find_all do |i|
      i.market_id == market_id
    end
  end
  def market
    FarMar::Market.find(@market_id)
  end

  def products
    FarMar::Product.by_vendor(@vend_id)
  end
end
