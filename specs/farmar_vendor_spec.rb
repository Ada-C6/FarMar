require_relative 'spec_helper'

describe FarMar::Vendor do
  # would need to change if dataset were to change
  let(:vendor) { FarMar::Vendor.new({vendor_id: 1, vendor_name: "Feil-Farrell", num_employees: 8, market_id: 1}) }

  describe "#initialize" do
    # considered with variable dataset in mind
    it "can create a new instance of Vendor" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "all" do
    # would need to change if dataset were to change
    it "should put all values of its CSV file into an array" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "find(id)" do
    # would need to change if dataset were to change
    it "should let the user know if the id is not present" do
      proc { FarMar::Vendor.find(2691) }.must_raise("ID was not present")
    end

    # would need to change if dataset were to change
    it "should find a specific Market by the market_id" do
      FarMar::Vendor.all
      found_vendor = FarMar::Vendor.find(1)
      found_vendor.vendor_id.must_equal(1)
      found_vendor.vendor_name.must_equal(vendor.vendor_name)
    end
  end

  describe "#market" do
    # would need to change if dataset were to change
    it "should return the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field" do
      vendor.market.must_equal("People\'s Co-op Farmers Market")
    end

    # considered with variable dataset in mind
    it "should be an instance of market" do
      associated_market = FarMar::Market.find(vendor.vendor_id)
      associated_market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "#products" do
    # would need to change if dataset were to change
    it "should return a collection of FarMar::Product instances associated with a vendor_id" do
      vendor.products.length.must_equal(1)
    end
  end

  describe "#sales" do
    # would need to change if dataset were to change
    it "should return a collection of FarMar::Sale instances associated with a vendor_id" do
      vendor.sales.length.must_equal(7)
    end
  end

  describe "#revenue" do
    # would need to change if dataset were to change
    it "should return the sum of all the vendor's sales (in cents)" do
      vendor.revenue.must_equal(38259)
    end
  end

  describe "by_market(market_id)" do
    # would need to change if dataset were to change
    it "should return all of the vendors with a given market_id" do
      FarMar::Vendor.new({vendor_id: 1, vendor_name: "Feil-Farrell", num_employees: 8, market_id: 1})
      FarMar::Vendor.by_market(1).length.must_equal(6)
    end
  end

end
