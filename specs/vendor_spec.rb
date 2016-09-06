require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    test_vendor = FarMar::Vendor.new(789)

    it "should create a new instance" do
      test_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end
end
