require_relative 'spec_helper'

describe "FarMar::Vendor" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Vendor class" do
            FarMar::Vendor.new({}).must_be_instance_of(FarMar::Vendor)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Vendor objects with length matching CSV size" do
            csv_vendors = FarMar::Vendor.all
            expected_length = CSV.read('support/vendors.csv').size
            csv_vendors.class.must_equal(Hash)
            csv_vendors.values[rand(0..expected_length)].must_be_instance_of(FarMar::Vendor)
            csv_vendors.length.must_equal(expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Vendor.find("cats") }.must_raise(ArgumentError)
        end

        it "should return a FarMar::Vendor object with data that corresponds to the id argument passed in" do
            found_vendor = FarMar::Vendor.find(2468)
            found_vendor.must_be_instance_of(FarMar::Vendor)
            found_vendor.vendor_id.must_equal(2468)
            found_vendor.name.must_equal("Tillman-Schowalter")
        end #
    end # self.find

end # FarMar::Vendor
