require_relative 'spec_helper'
require_relative '../lib/farmar_vendor'

describe FarMar::Vendor do
  describe "#initialize" do
    vendor = FarMar::Vendor.new
    it "should create an instance of FarMar::Vendor class" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end
  end
end
