require_relative 'spec_helper'

describe FarMar::Vendors do
    describe "#initialize" do
        it "can create a new instance of Vendors" do
            v = FarMar::Vendors.new({id: 1234, name: "Sweet Bumpas", no_employees: 2, market_id: 123})
            v.must_be_instance_of(FarMar::Vendors)
        end

        it "can assign instance variables according to the input hash" do
            v = FarMar::Vendors.new({id: 1234, name: "Sweet Bumpas", no_employees: 2, market_id: 123})
            v.id.must_equal(1234)
            v.no_employees.must_be_instance_of(Fixnum)
            v.name.must_be_instance_of(String)
        end
    end
end
