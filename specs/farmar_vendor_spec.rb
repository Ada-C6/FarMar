require_relative 'spec_helper'

describe FarMar::Vendor do

  let(:vendor) { FarMar::Vendor.new({vendor_id: 1, vendor_name: "Feil-Farrell", num_employees: 8, market_id: 1}) }

  describe "#initialize" do
    it "can create a new instance of Vendor" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      proc { FarMar::Vendor.find(2691) }.must_raise("ID was not present")
    end

    it "should find a specific Market by the market_id" do
      FarMar::Vendor.all
      found_vendor = FarMar::Vendor.find(1)
      found_vendor.vendor_id.must_equal(1)
      found_vendor.vendor_name.must_equal(vendor.vendor_name)
    end
  end

  describe "#market" do
    it "should return the Market instance associated with this vendor's market_id" do
      vendor.market.must_equal("People\'s Co-op Farmers Market")
    end

    it "should be an instance of market" do
      associated_market = FarMar::Market.find(vendor.vendor_id)
      associated_market.must_be_instance_of(FarMar::Market)
    end

    describe "#products" do
      it "should return a collection of FarMar::Product instances associated with a vendor_id" do
        vendor.products.length.must_equal(1)
      end
    end

    describe "#sales" do
      it "should return a collection of FarMar::Sale instances associated with a vendor_id" do
        vendor.sales.length.must_equal(1)
      end
    end
  end
end
