require_relative 'spec_helper'

describe FarMar::Vendor do
    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            # id, name, num_of_employees, market_id
            a = FarMar::Vendor.new(456, 'VendorKelly', 5, 123)
            a.id.must_equal(456)
            a.name.must_equal('VendorKelly')
            a.num_of_employees.must_equal(5)
            a.market_id.must_equal(123)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Vendor.all
            a[0].name.must_equal("Feil-Farrell")
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Vendor.find(1).name.must_equal("Feil-Farrell")
        end

    end
end
