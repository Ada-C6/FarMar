require_relative 'spec_helper'
# require_relative '../lib/market'
# require 'far_mar'

describe FarMar::Market do
  # p = FarMar::Market.new(market_hash)
  # market_info = {
  #   id: 1,
  #   name: "washington market",
  #   address: "111 s st",
  #   city: 123,
  #   product_id: 123
  # }
  p = FarMar::Market.new(1, "name", "address", "city", "county", "state", 98102)

  # (id, name, address, city, county, state, zip)

  describe "initialize" do
    it "should be an instance of Market" do

      p.must_be_instance_of(FarMar::Market)

    end
  end


  describe "self.all" do
    it "should be able to return Market name" do
      q =  FarMar::Market.all
      s = q[1]
      s.name.must_equal("People's Co-op Farmers Market")
    end
  end
  describe "self.find" do
    market_find = FarMar::Market.find(1)
    it "should be a kind of FarMar::Market" do
      market_find.must_be_kind_of(FarMar::Market)
    end
    it "should return zipcode '97202' if the id 1 " do
      market_find.zip.must_equal "97202"
    end
  end
  # it should return a Hash.

  describe "#vendors " do
    # market_id = FarMar::Market.new(3, "name", "address", "city", "county", "state", 98102)
    it "returns a collection of FarMar::Vendor instances associated
    with the market by the market_id field " do
    p.vendors.must_be_kind_of(Array)
  end
end
end

# vendor.  length shlul be ...
