require_relative 'spec_helper'

module FarMar
  describe Market do

    describe "#initialize" do
      let(:market) { Market.new({id: 501, name: "Pike Place", address: "123 Pike St", city: "Seattle", county: "King", state: "WA", zip: "98116"}) }

      it "should create an instance of Market" do
        market.must_be_instance_of(Market)
      end
    end

    describe "all" do
      it "should return an Array" do
        Market.all.must_be_kind_of(Array)
      end
    end

    describe "find(id)" do
      it "should return a hash if the input id equals one of the ids in the hash" do
        m = Market.new(501) # , "Pike Place Market", "123 Pike St", "Seattle", "King", "WA", "98119"
        m.find(501).must_equal(market[:id])
      end
    end
  end
end
