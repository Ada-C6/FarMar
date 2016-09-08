require_relative 'spec_helper'
# require_relative '../lib/farmar_market'

describe FarMar::Market do
  let (:my_market) {FarMar::Market.new({})}
  describe "#initialize" do

    it "must create a Market object" do
      my_market.must_be_instance_of(FarMar::Market)
    end

    it "must respond to id attribute" do
      my_market.must_respond_to(:id)
    end

  end

  describe "self.all" do

    it "must return an array" do
      FarMar::Market.all.must_be_instance_of(Array)
    end

    it "contains elements that are Markets that have IDs" do
      FarMar::Market.all[0].id.must_equal 1
    end

  end

  describe "self.find" do

    it "returns a Market instance" do
      FarMar::Market.find(123).must_be_instance_of(FarMar::Market)
    end

    it "can find a specific market by ID" do
      FarMar::Market.find(10).name.must_equal("Saratoga Farmers' Market")
    end

  end

  describe "#vendors" do
    another_market = FarMar::Market.new(id: 37)
    it "returns an Array" do
      another_market.vendors.must_be_instance_of(Array)
    end

    it "contains information about the market" do
      another_market.vendors[0].name.must_equal("Sipes Group")
    end

  end
end
