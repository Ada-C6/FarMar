require_relative 'spec_helper'

#WED - clean up the initialize test by using let() syntax, see market_spec.rb for reference.

describe FarMar::Product do
    describe "#initialize" do
        it "can create a new instance of Product" do
            p = FarMar::Product.new({id: 2345, name: "Gluten Free Ice Cream Sandwich", vendor_id: 1234})
            p.must_be_instance_of(FarMar::Product)
        end

        it "can assign instance variables according to the input hash" do
            p = FarMar::Product.new({id: 2345, name: "Gluten Free Ice Cream Sandwich", vendor_id: 1234})
            p.name.must_equal("Gluten Free Ice Cream Sandwich")
            p.vendor_id.must_be_instance_of(Fixnum)
        end
    end
end
