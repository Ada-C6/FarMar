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
      @vendor.products.length.must_equal 1
    end
  end
  
end
