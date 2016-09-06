require_relative 'spec_helper'

describe "FarMar::Product" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Product class" do
            FarMar::Product.new.must_be_instance_of(FarMar::Product)
        end

    end # initialize
end # FarMar::Product
