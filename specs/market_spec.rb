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
    it "should return an Array" do
      markets = FarMar::Market.new({})
      markets.vendors.must_be_kind_of(Array)
    end

    it "should return an array of vendors based on the market_id" do
      vendors = FarMar::Vendor.by_market(2)

      vendors.each do |i|
        i.market_id.must_equal(2)
      end
    end
  end

end
