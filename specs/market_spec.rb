require_relative 'spec_helper'
require 'csv'

describe FarMar::Market do
  describe "#initialize" do

    #using before
    before(:all) do
      @market = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
    end

    it "can initialize a new instance of Market" do
      @market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Market.all.length.must_equal(500)
    end
  end

  describe "self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Market.all
      FarMar::Market.find(2).name.must_equal("Silverdale Farmers Market")
    end
  end

  describe "#vendors" do
    it "should return a collection of FarMar::Vendor instances" do
      market = FarMar::Market.new("3","Dolgeville Farmer's Market","(Parking Lot) Between Main St. and Helmer Ave","Dolgeville","Herkimer","New York","13329")
      FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      FarMar::Vendor.new("11","Donnelly-Quigley","7","3")
      FarMar::Vendor.new("12","Windler Inc","4","3")
      FarMar::Vendor.new("17","Langosh, Krajcik and Langosh","11","5")
      market.vendors.length.must_equal(3)
    end
  end

end
