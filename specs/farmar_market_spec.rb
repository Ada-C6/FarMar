require_relative 'spec_helper'

describe FarMar::Market do

  let(:market) { FarMar::Market.new({market_id: 6, market_name: "Test", market_street: "12345 Test Lane", market_city: "Seattle", market_county: "King", market_state: "WA", market_zip: "98107"}) }

  describe "#initialize" do

    it "can create a new instance of Market" do
      market.must_be_instance_of(FarMar::Market)
    end

    it "should know about its related CSV file" do
      market.market_csv.wont_be_empty
    end
  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      FarMar::Market.new({market_id: 6, market_name: "Test", market_street: "12345 Test Lane", market_city: "Seattle", market_county: "King", market_state: "WA", market_zip: "98107"})
      puts FarMar::Market.all.length
      FarMar::Market.all.length.must_equal(500)
    end
  end

end
