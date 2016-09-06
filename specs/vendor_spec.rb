require_relative 'spec_helper'

describe "FarMar::Vendor" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Vendor class" do
            FarMar::Vendor.new.must_be_instance_of(FarMar::Vendor)
        end

    end # initialize
end # FarMar::Vendor
