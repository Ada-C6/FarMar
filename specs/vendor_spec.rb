require_relative 'spec_helper'

module FarMar
  describe Vendor do
    let(:ven) {Vendor.new(1, "vendor name", 1, 1)}
    describe "#initialize" do
      it "should make a new instance of vendor" do
        #write something here to test new instance of vendor
        ven.must_be_instance_of(Vendor)
        # ID - (Fixnum) uniquely identifies the vendor
        # Name - (String) the name of the vendor (not guaranteed unique)
        # No. of Employees - (Fixnum) How many employees the vendor has at the market
        # Market_id - (Fixnum) a reference to which market the vendor attends
      end
      it "should respond to .name with a string" do
        ven.name.must_be_instance_of(String)
      end

      it "should respond to .name with the correct name" do
        ven.name.must_equal("vendor name")
      end
    end
    describe "#self.all" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      it "should return a collection of Vendor objects" do
        # I'm going to use the id as the key, rest of info as value.
        Vendor.all.must_be_instance_of(Hash)
      end
      it "should contain a specific Vendor object, given the key" do
        Vendor.all.must_include(2)
    end
    describe "self.find(id)" do
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      it "should return a vendor, given an id" do
        Vendor.find(2).must_be_instance_of(Vendor)
      end

      it "should return the correct name given the id" do
        Vendor.find(74).name.must_equal("Haag-Padberg")
        # 74,Haag-Padberg,3,17
      end
    end
  end

  end
end
