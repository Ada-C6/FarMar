require_relative 'spec_helper'

describe FarMar::Product do
    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            a = FarMar::Product.new(1, 'Dry Beets', 1)
            a.id.must_equal(1)
            a.name.must_equal('Dry Beets')
            a.vendor_id.must_equal(1)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Product.all
            a[0].name.must_equal("Dry Beets")
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Product.find(1).name.must_equal("Dry Beets")
        end
    end
end
