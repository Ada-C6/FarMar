require_relative 'spec_helper'
require 'csv'

describe FarMar::Vendor do

  describe "#initialize" do
    it "can initialize a new instance of Vendor" do
      vendor = FarMar::Vendor.new("7","Bechtelar Inc","4","2")
      vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Vendor.all
      FarMar::Vendor.find(464).name.must_equal("Gutkowski Group")
    end
  end

  describe "#market" do
    it "should return the FarMar::Market instance associated with vendor" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      ven.market.name.must_equal("Dolgeville Farmer's Market")
    end
  end

  describe "#products" do
    it "should return a collection of FarMar::Product instances associated by vendor_id" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      ven.products.must_equal(["Fierce Beef", "Helpless Bread", "Yummy Bread", "Broken Beets"])
    end
  end
end
