require_relative 'spec_helper'

describe FarMar::Sale do
    describe "#initialize" do
        let (:s) {FarMar::Sale.new({id: 345678, amount: 500, purchase_time: "2013-11-12 12:00:35 -0800", vendor_id: 1234, product_id: 2345})}
        it "can create a new instance of Sale" do
            s.must_be_instance_of(FarMar::Sale)
        end

        it "can assign instance variables according to the input hash" do
            s.id.must_equal(345678)
            s.product_id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Sale.all.must_be_instance_of(Array)
        end

        it "will contain an object as each element of the array" do
            FarMar::Sale.all[0].must_be_instance_of(FarMar::Sale)
            FarMar::Sale.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output an object" do
            FarMar::Sale.find(FarMar::Sale.all[0].id).must_be_instance_of(FarMar::Sale)
        end
    end
end
