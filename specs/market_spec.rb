require_relative 'spec_helper'
require_relative '../lib/market'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      market_hash = FarMar::Market.new("market_hash")
      market_hash.must_be_instance_of(FarMar::Market)
    end

  end

  describe "self.all" do
    let(:markets) { FarMar::Market.all }

    it "should return an Array from the CSV file" do
      markets.must_be_kind_of(Array)
    end

  end

  describe "self.find(id)" do
    let(:markets) { FarMar::Market.all }

    it "should return a Array" do
      markets.must_be_kind_of(Array)
    end

    it "should have a value property" do
      markets.must_respond_to("2")
    end

  end
end
