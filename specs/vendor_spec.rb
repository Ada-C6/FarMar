require_relative 'spec_helper'
# require_relative '../vendor'

describe FarMar::Vendor do

  vendor_info = {
    id: 123,
    name: "bibi",
    no_of_employee: 88,
    market_id: 888
  }

  p = FarMar::Vendor.new(vendor_info)

  describe "#initialize" do
    it "should be an instance of Vendor" do
    p.must_be_instance_of(FarMar::Vendor)
    end
  end
end
