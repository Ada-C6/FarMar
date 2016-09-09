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

  describe "by_market" do
    it "returns all names of Vendor instances associated with the argument's market id" do
      FarMar::Vendor.by_market(4).must_equal(["Grady, Hudson and Olson", "Stracke Group", "Hyatt-King", "Homenick-Kuhn"])
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

  describe "#sales"do
    it "returns all instances of Sale associated with that instance of Vendor" do
      this_vendor = FarMar::Vendor.find(100)
      this_vendor.sales.must_equal([1966, 6470, 8721])
    end
  end

  describe "#revenue" do
    it "returns the sum of all amounts of Sale instances associated with that instance of Vendor" do
      dwight = FarMar::Vendor.find(10)
      dwight.revenue.must_equal("This vendor's total revenue is $326.28 ")
    end
  end
end
