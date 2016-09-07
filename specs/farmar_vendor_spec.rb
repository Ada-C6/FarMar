require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    vendor = FarMar::Vendor.new(8, "Kool Kumquats", 3, 7)

    it "should create an instance of FarMar::Vendor class" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should pass 4 arguments: ID - (Fixnum), Name - (String), No. of Employees - (Fixnum), Market_id - (Fixnum) and allow reading of ID" do
      vendor.id.must_equal(8)
    end
  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Vendor.all.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Vendor instances" do
      FarMar::Vendor.all[8].must_be_instance_of(FarMar::Vendor)
    end

    it "should return a collection of FarMar::Vendor instances created from the CSV file" do
      FarMar::Vendor.all[6].name.must_equal("Bechtelar Inc")
    end
  end

  describe "self.find(id)" do
    it "should return an instance of FarMar::Vendor" do
      FarMar::Vendor.find(12).must_be_instance_of(FarMar::Vendor)
    end

    it "should return the instance of FarMar::Vendor that matches the passed id" do
      FarMar::Vendor.find(12).id.must_equal(12)
    end

    it "should return the instance of FarMar::Vendor that matches the passed id, check for name" do
      FarMar::Vendor.find(12).name.must_equal("Windler Inc")
    end

  end

  windler_vendor = FarMar::Vendor.find(12)

  describe "#market" do
    it "should return a FarMar::Market instance" do
      windler_vendor.market.must_be_instance_of(FarMar::Market)
    end

    it "should return the FarMar::Market instance that is associated with this vendor using market_id" do
      windler_vendor.market.name.must_equal("Dolgeville Farmer's Market")
    end
  end

  describe "#products" do
    it "should return an array" do
      windler_vendor.products.must_be_kind_of(Array)
    end

    ## continue here
  end
end
