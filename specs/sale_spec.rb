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

    describe "vendor" do
        let(:s) {FarMar::Sale.all.last}
        it "will output a Vendor object" do
            s.vendor.must_be_instance_of(FarMar::Vendor)
        end

        it "will output the object whose vendor id corresponds to the current sale instance's vendor id" do
            s.vendor.id.must_equal(s.vendor_id)
        end
    end

    describe "product" do
        let(:s) {FarMar::Sale.all.last}
        it "will output a Product object" do
            s.product.must_be_instance_of(FarMar::Product)
        end

        it "will output the object whose product id corresponds to the current sale instance's product id" do
            s.product.id.must_equal(s.product_id)
        end
    end

    describe "self.between(beginning_time, end_time)" do
        let(:sample_begin_time) {FarMar::Sale.all.first.purchase_time}
        let(:sample_end_time) {FarMar::Sale.all.last.purchase_time}
        it "will output an array" do
            FarMar::Sale.between(sample_begin_time, sample_end_time).must_be_instance_of(Array)
        end

        it "will contain a Sale object as each element of the array" do
            FarMar::Sale.between(sample_begin_time, sample_end_time).first.must_be_instance_of(FarMar::Sale)
            FarMar::Sale.between(sample_begin_time, sample_end_time).last.must_be_instance_of(FarMar::Sale)
        end
    end
end
