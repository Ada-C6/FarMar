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

      it "represents all of the objects described in the CSV" do
        Market.all.count.must_equal(500)
      end
    end

    describe "find(id)" do
      it "should return the id that the passed parameter matches" do
        Market.find(12).id.must_equal(12)
      end

      it "should return the city that the passed parameter matches" do
        Market.find(155).city.must_equal("Charles Town")
      end
    end

    describe "#vendor" do

      it "should return true if the amount of vendors for the instance of Market is the number of instances of Vendor with that market_id." do
        m = Market.find(2)
        m.vendor.length.must_equal(3)
      end
    end
  end
end


# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
