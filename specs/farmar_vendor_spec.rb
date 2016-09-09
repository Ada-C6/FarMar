require_relative 'spec_helper'

describe FarMar::Vendor do

  before (:each) do
    @all_vendors = FarMar::Vendor.all
    vendor_hash = {}
    vendor_csv_file = CSV.read("../FarMar/support/vendors.csv")
    vendor_csv_file.each do |vendor|
      vendor_hash[:vendor_id] = vendor[0].to_i
      vendor_hash[:vendor_name] = vendor[1].to_s
      vendor_hash[:num_employees] = vendor[2].to_i
      vendor_hash[:market_id] = vendor[3].to_i
    end
    @vendor = FarMar::Vendor.new(vendor_hash)
    @all_markets = FarMar::Market.all
  end

  describe "#initialize" do
    it "can create a new instance of Vendor" do
      @vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      # if time after total refactoring, would like to see if there's additional things to check to make this more useful
      FarMar::Vendor.all.wont_be_empty
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      test_hash = {}
      test_hash[:vendor_id] = @all_vendors.length + 1
      test_hash[:vendor_name] = "Test"
      test_hash[:num_employees] = 0
      test_hash[:market_id] = 2

      proc { FarMar::Vendor.find(vendor_id) }.must_raise("ID was not present")
    end

    it "should find a specific Vendor by the vendor_id" do
      found_vendor = FarMar::Vendor.find(@vendor.vendor_id)
      found_vendor.vendor_id.must_equal(@vendor.vendor_id)
      found_vendor.vendor_name.must_equal(@vendor.vendor_name)
    end
  end

  describe "#market" do
    it "should return the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field" do
      associated_market = FarMar::Market.find(@vendor.market_id)
      @vendor.market.must_equal(associated_market.market_name)
    end

    it "should be an instance of market" do
      associated_market = FarMar::Market.find(@vendor.market_id)
      associated_market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "#products" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return a collection of FarMar::Product instances associated with a vendor_id" do
      @vendor.products.wont_be_empty
    end
  end

  describe "#sales" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return a collection of FarMar::Sale instances associated with a vendor_id" do
      @vendor.sales.wont_be_empty
    end
  end

  describe "#revenue" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return the sum of all the vendor's sales (in cents)" do
      @vendor.revenue.must_be_instance_of(Fixnum)
    end
  end

  describe "by_market(market_id)" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return all of the vendors with a given market_id" do
      FarMar::Vendor.new({vendor_id: 1, vendor_name: "Feil-Farrell", num_employees: 8, market_id: 1})
      FarMar::Vendor.by_market(@vendor.market_id).wont_be_empty
    end
  end

end
