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
end
