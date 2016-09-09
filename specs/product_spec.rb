require_relative 'spec_helper'

describe FarMar::Product do
    let(:p) {FarMar::Product.all.last}
    describe "#initialize" do
        let (:p_manual) {FarMar::Product.new({id: 2345, name: "Gluten Free Ice Cream Sandwich", vendor_id: 1234})}
        it "can create a new instance of Product" do
            p_manual.must_be_instance_of(FarMar::Product)
        end

        it "can assign instance variables according to the input hash" do
            p_manual.name.must_equal("Gluten Free Ice Cream Sandwich")
            p_manual.vendor_id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Product.all.must_be_instance_of(Array)
        end

        it "will contain a product object as each element of the array" do
            FarMar::Product.all[0].must_be_instance_of(FarMar::Product)
            FarMar::Product.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output a product object" do
            FarMar::Product.find(FarMar::Product.all[0].id).must_be_instance_of(FarMar::Product)
        end

        it "must take a valid argument" do
            proc {FarMar::Product.find(2000000000)}.must_raise(ArgumentError)
        end
    end

    describe "vendor" do
        it "will output a vendor object" do
            p.vendor.must_be_instance_of(FarMar::Vendor)
        end

        it "will output the object whose vendor id corresponds to the current product instance's vendor id" do
            p.vendor.id.must_equal(p.vendor_id)
        end
    end

    describe "sales" do
        it "will output an array" do
            p.sales.must_be_instance_of(Array)
        end

        it "will output sale objects that correspond to the current product id" do
            p.sales.first.product_id.must_equal(p.id)
            p.sales.last.product_id.must_equal(p.id)
        end
    end

    describe "number_of_sales" do
        it "will output a number" do
            p.number_of_sales.must_be_instance_of(Fixnum)
        end
    end

    describe "self.by_vendor(vendor_id)" do
        let(:vendor_id) {FarMar::Vendor.all.last.id}
        it "will output an array" do
            FarMar::Product.by_vendor(vendor_id).must_be_instance_of(Array)
        end

        it "will contain a product object as each element of the array" do
            FarMar::Product.by_vendor(vendor_id)[0].must_be_instance_of(FarMar::Product)
            FarMar::Product.by_vendor(vendor_id)[0].name.must_be_instance_of(String)
        end

        it "will output product objects whose vendor id corresponds to the vendor id passed into the method" do
            FarMar::Product.by_vendor(vendor_id).first.vendor_id.must_equal(vendor_id)
            FarMar::Product.by_vendor(vendor_id).last.vendor_id.must_equal(vendor_id)
        end

        it "must take a valid argument" do
            proc {FarMar::Product.by_vendor(2000000000)}.must_raise(ArgumentError)
        end
    end
end
