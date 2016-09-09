require_relative 'spec_helper'

describe FarMar::Market do
    describe "#initialize" do
        let(:m) {FarMar::Market.new({id: 123, name: "Marina", address: "456 Ruby St", city: "Rochester", county: "Graham", state: "WY", zip: "00529"})}
        it "can create a new instance of Market" do
            m.must_be_instance_of(FarMar::Market)
        end

        it "can assign instance variables according to the input hash" do
            m.county.must_equal("Graham")
            m.id.must_be_instance_of(Fixnum)
            m.zip.must_be_instance_of(String)
        end
    end

    describe "self.all" do
        it "will output an array" do
            FarMar::Market.all.must_be_instance_of(Array)
        end

        it "will contain a market object as each element of the array" do
            FarMar::Market.all[0].must_be_instance_of(FarMar::Market)
            FarMar::Market.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output a market object" do
            FarMar::Market.find(FarMar::Market.all[0].id).must_be_instance_of(FarMar::Market)
        end

        it "must take a valid argument" do
            proc {FarMar::Market.find(2000000000)}.must_raise(ArgumentError)
        end
    end

    describe "vendors" do
        let(:m) {FarMar::Market.all.last}
        it "will output an array" do
            m.vendors.must_be_instance_of(Array)
        end

        it "will output vendor objects that correspond to the current market_id" do
            m.vendors.first.market_id.must_equal(m.id)
            m.vendors.last.market_id.must_equal(m.id)
        end
    end
end
