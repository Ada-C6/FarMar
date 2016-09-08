require_relative 'spec_helper'

describe FarMar::Vendor do
    describe "#initialize" do
        let(:v) {FarMar::Vendor.new({id: 1234, name: "Sweet Bumpas", number_employees: 2, market_id: 123})}
        it "can create a new instance of Vendor" do
            v.must_be_instance_of(FarMar::Vendor)
        end

        it "can assign instance variables according to the input hash" do
            v.id.must_equal(1234)
            v.number_employees.must_be_instance_of(Fixnum)
            v.name.must_be_instance_of(String)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Vendor.all.must_be_instance_of(Array)
        end

        it "will contain an object as each element of the array" do
            FarMar::Vendor.all[0].must_be_instance_of(FarMar::Vendor)
            FarMar::Vendor.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output an object" do
            FarMar::Vendor.find(FarMar::Vendor.all[0].id).must_be_instance_of(FarMar::Vendor)
        end
    end

    describe "self.by_market(market_id)" do
        let(:market_id) {FarMar::Market.all.last.id}
        it "will output an array" do
            FarMar::Vendor.by_market(market_id).must_be_instance_of(Array)
        end

        it "will contain an object as each element of the array" do
            FarMar::Vendor.by_market(market_id)[0].must_be_instance_of(FarMar::Vendor)
            FarMar::Vendor.by_market(market_id)[0].name.must_be_instance_of(String)
        end
    end
end
