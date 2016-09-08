require_relative 'spec_helper'

describe FarMar::Market do
  # would need to change if dataset were to change
  let(:market) { FarMar::Market.new({market_id: 6, market_name: "Jefferson City Farmer's Market", market_street: "000 Main Street", market_city: "Jefferson City", market_county: "Cole", market_state: "Missouri", market_zip: 0}) }

  describe "#initialize" do
    # considered with variable dataset in mind
    it "can create a new instance of Market" do
      market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "all" do
    # would need to change if dataset were to change
    it "should put all values of its CSV file into an array" do
      FarMar::Market.all.length.must_equal(500)
    end
  end

  describe "find(id)" do
    # would need to change if dataset were to change
    it "should let the user know if the id is not present" do
      proc { FarMar::Market.find(501) }.must_raise("ID was not present")
    end

    # would need to change if dataset were to change
    it "should find a specific Market by the market_id" do
      FarMar::Market.all
      found_market = FarMar::Market.find(6)
      found_market.market_id.must_equal(6)
      found_market.market_name.must_equal(market.market_name)
    end
  end

  describe "#vendors" do
    # would need to change if dataset were to change
    it "should return a collection of FarMar::Vendor instances that are associated with the market_id field" do
      market.vendors.length.must_equal(3)
    end
  end
end
