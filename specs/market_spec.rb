require_relative 'spec_helper'
require_relative '../lib/market'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      market_hash = FarMar::Market.new("market_hash")
      market_hash.must_be_instance_of(FarMar::Market)
    end
  end

  describe "self.all" do
    let(:markets) { FarMar::Market.all }

    it "should return an Array from the CSV file" do
      markets.must_be_kind_of(Array)
    end
  end

  describe "self.find(input)" do
    let(:markets) { FarMar::Market.find(2) }

    it "should return an instance of FarMar::Market" do
      markets.must_be_instance_of(FarMar::Market)
    end

    it "should return a market based on market_id input" do
      markets.market_id.must_equal(2)
    end
  end

  describe "#vendors" do

    # it "should return an Array" do
    #   market = FarMar::Market.new(905)
    #   vendor = FarMar::Vendor.new(905)
    #   market.vendors.must_be_kind_of(Array)
    # end
    #
    # it "should return an array of vendors based on the market_id" do
    #   market = FarMar::Market.new({"market_id" => 905, "name" => "Howdy", "address" => "42987 Street", "city" => "Seattle", "county" => "Allegheny", "state" => "WA", "zip" => "98102"})
    #   vendor = FarMar::Vendor.new({"vendor_id" => 2, "name" => "Capitol Hill", "employees" => 2, "market_id" => 905})
    #   market.vendors.must_equal(vendor)
    # end

  end

end
