require_relative 'spec_helper'

describe FarMar::Sale do
    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            a = FarMar::Sale.new(1, 9290, '2013-11-07 04:34:56 -0800', 1, 1)
            a.id.must_equal(1)
            a.amount.must_equal(9290)
            a.purchase_time.must_equal('2013-11-07 04:34:56 -0800')
            a.vendor_id.must_equal(1)
            a.product_id.must_equal(1)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Sale.all
            a[0].amount.must_equal(9290)
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Sale.find(1).amount.must_equal(9290)
        end

    end
end
