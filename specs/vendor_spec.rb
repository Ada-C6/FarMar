require_relative 'spec_helper'

describe FarMar::Vendor do

  p = FarMar::Vendor.new(2, "bibi", 28, 8)

  describe "#initialize" do
    it "should be an instance of Vendor" do
      p.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "slef.find" do
    it "should return the name of the vendor given a vendor id" do
      FarMar::Vendor.find(1).name.must_equal("Feil-Farrell")
    end
  end

  describe "market" do
    it "should be a kind of Array" do
      p.market.must_be_kind_of(Array)
    end
  end

  describe "sales" do
    it "should be a kind of array" do
      p.sales.must_be_kind_of(Array)
    end
  end

  describe "self.by_market" do
    it "should return the vendors given the vendor information" do
      FarMar::Vendor.by_market(1).each do |line|
        line.market_id.must_equal(1)
      end
    end
  end

  describe "products" do
    it "should return an array" do
      p.products.must_be_kind_of(Array)
    end
    it "should return an array" do
      p = FarMar::Vendor.new(2, "bibi", 28, 8)
      p.products.length.must_equal(2)
    end
  end

  describe "self.by_vendor" do
    it "should return the products given the vendor information" do
      FarMar::Product.by_vendor(1).each do |line|
        line.vendor_id.must_equal(1)
      end
    end
  end

  describe "revenue" do
    it "should return the sum of the total amount sold in as a Fixnum" do
      p.revenue.must_be_kind_of(Fixnum)
    end
    it "should return the sum of the total amount sold " do
      p = FarMar::Vendor.new(13, "bibi", 28, 8)
      p.revenue.must_equal(2848)
    end
  end
end


# describe

# let (:rererer) {Vendor.new(ereererr)}
# :ererer some vendor
