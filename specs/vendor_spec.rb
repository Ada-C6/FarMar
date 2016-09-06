require_relative 'spec_helper'
require_relative '../lib/vendor'

describe FarMar::Vendor do
  describe "#initialize" do

    it "can create a new instance of Vendor" do
      vendor_hash = FarMar::Vendor.new("vendor_hash")
      vendor_hash.must_be_instance_of(FarMar::Vendor)
    end

  end
end
