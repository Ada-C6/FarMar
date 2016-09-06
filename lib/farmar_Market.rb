require_relative '../far_mar'
class FarMar::Market
  def initialize
    puts "Market initialized"
  end

  def self.all
    # returns a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

  def vendors
    #: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  end
end
