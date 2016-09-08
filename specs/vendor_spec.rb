require_relative 'spec_helper'

describe FarMar::Market do

  describe "#initialize" do
    vegan_cheez = FarMar::Vendor.new(23, "cheez", 6, 32)

    it "should create an instance of Vendor" do
        vegan_cheez.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    fruit = FarMar::Vendor.all

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end

    it "should have a length of 2690" do
      fruit.length.must_equal(2690)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object matching the id passed" do
      fruit = FarMar::Vendor.find(2)
      fruit.id.must_equal(2)
    end
  end

  describe "market" do
    it "should return the market instance associated with this vendor" do
      zulauf = FarMar::Vendor.find(6)
      zulaf_market = FarMar::Market.find(1)
      zulauf.market.must_equal(zulaf_market)
    end
  end
end
