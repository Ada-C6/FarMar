require_relative 'spec_helper'

describe "FarMar::Market" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Market class" do
            FarMar::Market.new.must_be_instance_of(FarMar::Market)
        end

    end # initialize
end # FarMar::Market
