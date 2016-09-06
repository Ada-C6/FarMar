require_relative 'spec_helper'

module FarMar
  describe Vendor do
    describe "#initialize" do
      it "should make a new instance of vendor" do
        #write something here to test new instance of vendor
        Vendor.new(1, "vendor name", 1, 1).must_be_instance_of(Vendor)
        # ID - (Fixnum) uniquely identifies the vendor
        # Name - (String) the name of the vendor (not guaranteed unique)
        # No. of Employees - (Fixnum) How many employees the vendor has at the market
        # Market_id - (Fixnum) a reference to which market the vendor attends
      end
    end
    # self.all: returns a collection of instances, representing all of the objects described in the CSV
    # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end
end
