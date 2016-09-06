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
end
