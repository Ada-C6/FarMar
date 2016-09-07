require_relative 'spec_helper'

describe FarMar::Vendor do
  before (:each) do
    @vendor = FarMar::Vendor.new(1,"Test Vendor",1,1)
  end

  describe "#initialize" do
    it "should create a new instance of Vendor" do
      @vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Vendor.all.must_be_kind_of Hash
    end

    it "should have a hash key of \"1\" (as a fixnum)" do
      hash = FarMar::Vendor.all
      hash.has_key?(1).must_equal true
    end
  end

  describe "#self.find" do
    it "should return an instance of Vendor" do
      FarMar::Vendor.find(1).must_be_instance_of FarMar::Vendor
    end

    it "should raise an Argument Error if the ID provided isn't in the list" do
      proc { FarMar::Vendor.find(0) }.must_raise(ArgumentError)
    end

  end

  describe "#market" do
    it "should return an instance of Market" do
      @vendor.market.must_be_instance_of FarMar::Market
    end

    it "should have the Market ID match the Vendor Market ID" do
      @vendor.market.id.must_equal @vendor.id
    end
  end

  describe "#products" do
    it "should return a hash of products" do
      @vendor.products.must_be_kind_of Hash
    end

    it "should return a hash of one object for a vendor ID of 1" do
      @vendor.products.length.must_equal 1 # because @vendor on top is set up for a vendor ID of 1, this works
    end
  end

  describe "#sales" do
    it "should return a hash of products" do
      @vendor.sales.must_be_kind_of Hash
    end

    it "should return a hash of one object for a vendor ID of 2" do
      vend_test = FarMar::Vendor.new(2,"Test Vendor",1,1) # because @vendor on the top is set up for vendor id 1, this test needs its own instance
      vend_test.sales.length.must_equal 1
    end
  end

  describe "#revenue" do
    it "should return a fixnum" do
      @vendor.revenue.must_be_kind_of Fixnum
    end

    it "should only be a positive number" do
      @vendor.revenue.must_be :>=, 0
    end
  end
end
