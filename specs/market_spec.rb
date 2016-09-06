require_relative 'spec_helper'

module FarMar
  describe Market do

    describe "#initialize" do
      let(:market) { Market.new(:name) }

      it "should create an instance of Market" do
        market.must_be_instance_of(Market)
      end
    end

    describe "all" do
      it "should return an Array" do
        Market.all.must_be_kind_of(Array)
      end
    end
  end
end
