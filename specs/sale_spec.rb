require_relative 'spec_helper'

describe "FarMar::Sale" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Sale class" do
            FarMar::Sale.new.must_be_instance_of(FarMar::Sale)
        end

    end # initialize
end # FarMar::Sale
