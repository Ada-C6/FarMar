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

        it "will contain an object as each element of the array" do
            FarMar::Market.all[0].must_be_instance_of(FarMar::Market)
            FarMar::Market.all[0].id.must_be_instance_of(Fixnum)
        end
    end

    describe "self.find(id)" do
        it "will output an object" do
            FarMar::Market.find(FarMar::Market.all[0].id).must_be_instance_of(FarMar::Market)
        end
    end
end
