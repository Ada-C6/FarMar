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
    all_vendors = FarMar::Vendor.all

    it "should return an array" do
      all_vendors.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Vendor instances" do
      all_vendors[8].must_be_instance_of(FarMar::Vendor)
    end

    it "should return a collection of FarMar::Vendor instances created from the CSV file" do
      all_vendors[6].name.must_equal("Bechtelar Inc")
    end
  end

  describe "self.find(id)" do
    vendor_12 = FarMar::Vendor.find(12)

    it "should return an instance of FarMar::Vendor" do
      vendor_12.must_be_instance_of(FarMar::Vendor)
    end

    it "should return the instance of FarMar::Vendor that matches the passed id" do
      vendor_12.id.must_equal(12)
    end

    it "should return the instance of FarMar::Vendor that matches the passed id, check for name" do
      vendor_12.name.must_equal("Windler Inc")
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

    it "should return an array of FarMar::Product instances" do
      windler_vendor.products[1].must_be_instance_of(FarMar::Product)
    end

    it "should return a collection of Product instances associated with the vendor_id" do
      windler_vendor.products[1].vendor_id.must_equal(12)
    end
  end

  describe "#sales" do
    it "should return an array" do
      windler_vendor.sales.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Sale instances" do
      windler_vendor.sales[1].must_be_instance_of(FarMar::Sale)
    end

    it "should return an array of Sale instances that match the vendor_id" do
      windler_vendor.sales[1].vendor_id.must_equal(12)
    end
  end

  describe "#revenue(date optional)" do
    it "should return an integer" do
      windler_vendor.revenue.must_be_kind_of(Fixnum)
    end

    it "should return the sum of all the vendor's sales" do
      windler_vendor.revenue.must_equal(10969)
    end

    it "should return the total revenue for the passed date and vendor instance" do
      welch_vendor = FarMar::Vendor.find(515)
      date = DateTime.new(2013, 11, 11, 0, 0, 0, '-8')
      welch_vendor.revenue(date).must_equal(1851)
    end

  end

  describe "self.by_market(market_id)" do
    vendor_14 = FarMar::Vendor.by_market(14)

    it "should return an array of vendors" do
      vendor_14[1].must_be_instance_of(FarMar::Vendor)
    end

    it "should return only vendors that match the passed market_id" do
      vendor_14[1].market_id.must_equal(14)
    end

  end

  describe "self.find_by_name(name)" do
    it "should return the Vendor instance that matches the passed name" do
      FarMar::Vendor.find_by_name("Windler Inc").id.must_equal(FarMar::Vendor.find(12).id)
    end
  end

end
