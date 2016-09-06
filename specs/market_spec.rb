require_relative 'spec_helper'

module FarMar
  describe Market do
    describe "#initialize" do
      let(:new_market) { Market.new({}) }

      it "should create a new instace of Market" do
        new_market.must_be_instance_of(Market)
      end

    end

    describe ".all" do
      let(:all_markets) { Market.all }
      it "should return an array" do
        all_markets.must_be_kind_of(Array)
      end
    end

  end
end
