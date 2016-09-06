require_relative '../far_mar'
class FarMar::Vendor
  def initialize
    puts "Vendor initialized"
  end

  def self.all
    # returns a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

  def market
    #returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  end
  def products
    #returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  end

  def sales
    #returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  end

  def revenue
    #returns the the sum of all of the vendor's sales (in cents)
  end

  def self.by_market(market_id)
    #returns all of the vendors with the given market_id
  end

end
