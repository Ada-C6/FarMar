# lib/farmar_market.rb
require 'csv'

class Vendor
attr_reader :id, :name, :num_of_employees, :market_id


  def initialize(vendor)
    @id = vendor[:id]
    @name = vendor[:name]
    @num_of_employees = vendor[:num_of_employees]
    @market_id = vendor[:market_id]
  end

  def self.all
    all_vendors = []

    CSV.read('support/vendors.csv').each do |line|
      vendor = {}
      vendor[:id] = line[0].to_i
      vendor[:name] = line[1]
      vendor[:num_of_employees] = line[2].to_i
      vendor[:market_id] = line[3].to_i


      all_vendors << self.new(vendor)
    end

    return all_vendors
  end

  def self.find(id)
    all.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
    # if id > 500, returns entire array....fix later
  end

  def self.by_market(market_id)
    all_vendors = self.all
    all_vendors.find_all do |i|
      i.market_id == market_id
    end
  end

  def products
    Product.by_vendor(@id)
  end

  def market
    Market.find(@market_id)
  end

  def sales
    Sale.all.find_all do |instance|
      instance.vendor_id == @id
    end
  end

  def revenue
    y = []
    sales[0..-1].each do |x|
      y << x.amount_in_cents
    end
      y.reduce (:+)
  end

end
#market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
#products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
#sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
