require_relative 'spec_helper'

#WED - clean up the initialize test by using let() syntax, see market_spec.rb for reference.

describe FarMar::Sale do
    describe "#initialize" do
        it "can create a new instance of Sale" do
            s = FarMar::Sale.new({id: 345678, amount: 500, vendor_id: 1234, product_id: 2345, purchase_time: "Monday--will update this to datetime format later"})
            s.must_be_instance_of(FarMar::Sale)
        end

        it "can assign instance variables according to the input hash" do
            s = FarMar::Sale.new({id: 345678, amount: 500, vendor_id: 1234, product_id: 2345, purchase_time: "Monday--will update this to datetime format later"})
            s.id.must_equal(345678)
            s.product_id.must_be_instance_of(Fixnum)
        end
    end
end
