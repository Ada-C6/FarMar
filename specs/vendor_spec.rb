require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    it "can create a new instance of Vendor" do
      sam = FarMar::Vendor.new(19, "Betty", 8, 20)
      sam.must_be_instance_of(FarMar::Vendor)
    end
  end
end
