require_relative 'spec_helper'

describe FarMar::Market do
  let(:zulauf) {FarMar::Vendor.find(6)}

  describe "#initialize" do
    vegan_cheez = FarMar::Vendor.new(23, "cheez", 6, 32)

    it "should create an instance of Vendor" do
        vegan_cheez.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    let(:fruit) {FarMar::Vendor.all}

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end

    it "should have a length of 2690" do
      fruit.length.must_equal(2690)
    end
  end

  describe "self.find(id)" do
    let(:fruit) {FarMar::Vendor.find(2)}

    it "should return an instance of the object matching the id passed" do
      fruit.id.must_equal(2)
    end
  end

  describe "#market" do
    it "should return the market instance associated with this vendor" do
      zulaf_market = FarMar::Market.find(1)
      zulauf.market.must_equal(zulaf_market)
    end
  end

  describe "#products" do

    it "should return a collection of products belonging to that vendor" do
      zulauf.products.length.must_equal(3)
    end
  end

  describe "#sales" do

    it "should return a collection of sales belonging to that vendor" do
      zulauf.sales.length.must_equal(1)
    end
  end

  describe "#revenue" do
    
    it "should return the sum of all sales for that vendor" do
      zulauf.revenue.must_equal(2977.0)
    end
  end

  describe "self.by_market(market_id)" do
    it "shoulld return all vendors associated with that market id" do
      quincy_market = FarMar::Vendor.by_market(5)
      quincy_market.length.must_equal(2)

    end
  end
end
