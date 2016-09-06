require_relative 'spec_helper'

describe FarMar::Vendor do
  vendor = FarMar::Vendor.new(1,"Test Vendor",1,1)

  describe "#initialize" do
    it "should create a new instance of Vendor" do
      vendor.must_be_instance_of FarMar::Vendor
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
end
