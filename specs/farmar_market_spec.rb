require_relative 'spec_helper'

describe FarMar::Market do

  let(:market) { FarMar::Market.new({market_id: 6, market_name: "Jefferson City Farmer's Market", market_street: "000 Main Street", market_city: "Jefferson City", market_county: "Cole", market_state: "Missouri", market_zip: 0}) }

  describe "#initialize" do
    it "can create a new instance of Market" do
      market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      FarMar::Market.all.length.must_equal(500)
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      proc { FarMar::Market.find(501) }.must_raise("ID was not present")
    end

    it "should find a specific Market by the market_id" do
      FarMar::Market.all
      found_market = FarMar::Market.find(6)
      found_market.market_id.must_equal(6)
      found_market.market_name.must_equal(market.market_name)
    end



  end

end
