require_relative 'spec_helper'

describe FarMar::Markets do
    describe "#initialize" do
        it "can create a new instance of Markets" do
            m = FarMar::Markets.new({id: 123, name: "Marina", address: "456 Ruby St", city: "Rochester", county: "Graham", state: "WY", zip: "00529"})
            m.must_be_instance_of(FarMar::Markets)
        end

        it "can assign instance variables according to the input hash" do
            m = FarMar::Markets.new({id: 123, name: "Marina", address: "456 Ruby St", city: "Rochester", county: "Graham", state: "WY", zip: "00529"})
            m.county.must_equal("Graham")
            m.id.must_be_instance_of(Fixnum)
            m.zip.must_be_instance_of(String)
        end
    end
end
