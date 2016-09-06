require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    it "create a new instance of Vendor" do
      FarMar::Vendor.new.must_be_instance_of(FarMar::Vendor)
    end
  end

end
