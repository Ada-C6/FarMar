require_relative 'spec_helper'

describe FarMar::Vendor do
  vendor = FarMar::Vendor.new(0,"Test Vendor",1,1)

  describe "#initialize" do
    it "should create a new instance of Vendor" do
      vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Vendor.all.must_be_kind_of Hash
    end
  end
end
