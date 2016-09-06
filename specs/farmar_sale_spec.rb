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
end
