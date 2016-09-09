require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do

    it "can create a new instance of Vendor" do
      FarMar::Vendor.new(1584, "Quitzon-Jacobi", 3, 296).must_be_instance_of(FarMar::Vendor)
    end

  end

  describe "all" do
    it "returns all instances of Vendor" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "find" do
    it "returns the instance of Vendor whose vendor id matches the argument's vendor id" do
      this_vendor = FarMar::Vendor.find(2599)
      this_vendor.name.must_equal("Mills and Sons")
    end
  end

  describe "#market" do
    it "returns the instance of Market associated with that instance of Vendor" do
      vendor = FarMar::Vendor.find(5)
      vendor.market.id.must_be_same_as(FarMar::Market.find(1).id)
    end
  end

  describe "#products" do
    it "returns all instances of Product associated with that instance of Vendor" do
      vendor1 = FarMar::Vendor.find(100)
      vendor1.products.must_equal(["Combative Carrots", "Fair Fruit", "Cool Fish", "Bad Pretzel", "Hurt Burrito"])
    end
  end
end
