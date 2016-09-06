require_relative 'spec_helper'
require_relative '../lib/vendor.rb'

describe FarMar::Vendor do
  describe "#initialize" do

    it "should be able to create a new instance of Vendor" do
      vendor = FarMar::Vendor.new
      vendor.must_be_instance_of(FarMar::Vendor)
    end
  end
end
