require_relative 'spec_helper'

describe FarMar::Market do

  before (:each) do
    @all_markets = FarMar::Market.all
    market_hash = {}
    market_csv_file = CSV.read("../FarMar/support/markets.csv")
    market_csv_file.each do |market|
      market_hash[:market_id] = market[0].to_i
      market_hash[:market_name] = market[1].to_s
      market_hash[:market_street] = market[2].to_s
      market_hash[:market_city] = market[3].to_s
      market_hash[:market_county] = market[4].to_s
      market_hash[:market_state] = market[5].to_s
      market_hash[:market_zip] = market[6].to_i
    end
    @market = FarMar::Market.new(market_hash)
  end

  describe "#initialize" do
    it "can create a new instance of Market" do
      @market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "all" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should put all values of its CSV file into an array" do
      @all_markets.wont_be_empty
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      test_hash = {}
      test_hash[:market_id] = @all_markets.length + 1
      test_hash[:market_name] = "Test"
      test_hash[:market_street] = "1234 Test Lane"
      test_hash[:market_city] = "TestTown"
      test_hash[:market_county] = "Testit"
      test_hash[:market_state] = "Testington"
      test_hash[:market_zip] = 88888

      test_market = FarMar::Market.new(test_hash)

      FarMar::Market.find(test_market.market_id).must_equal("ID was not present")
    end

    it "should find a specific Market by the market_id" do
      found_market = FarMar::Market.find(@market.market_id)
      found_market.market_id.must_equal(@market.market_id)
      found_market.market_name.must_equal(@market.market_name)
    end
  end

  describe "#vendors" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return a collection of FarMar::Vendor instances that are associated with the market_id field" do
      @market.vendors.wont_be_empty
    end
  end
end
