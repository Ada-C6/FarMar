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

    describe "self.by_market(market_id)" do
        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Vendor.by_market("cats") }.must_raise(ArgumentError)
        end

        it "should return an array of FarMar::Vendor instances" do
            by_market_vendors = FarMar::Vendor.by_market(rand(0..500)) #vendors.csv contains 500 markets
            by_market_vendors.must_be_instance_of(Array)
            by_market_vendors[rand(0..by_market_vendors.length-1)].must_be_instance_of(FarMar::Vendor)
        end

        it "should return FarMar::Vendor instances with market_id matching the argument" do
            rand_id = rand(0..500)
            rand_vendors = FarMar::Vendor.by_market(rand_id)
            rand_vendors[rand(0..rand_vendors.length-1)].market_id.must_equal(rand_id)
        end
    end # self.by_market

    describe "instance methods" do
        describe "#market" do

        end #market

        describe "#products" do

        end #products

        describe "#sales" do

        end #salse

        describe "#revenue" do

        end #revenue

    end # instance methods before(:each)
end # FarMar::Vendor
