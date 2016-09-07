require_relative 'spec_helper'
# require_relative '../lib/farmar_market'

describe FarMar::Market do
  my_hash = {id: 37,
    name: "Guin's Market",
    address: "Ada Dev Academy",
    city: "Seattle",
    county: "King",
    state: "WA",
    zip: "99999"}
  let (:my_market) {FarMar::Market.new(my_hash)}
  describe "#initialize" do

    it "must create a Market object" do

      my_market.must_be_instance_of(FarMar::Market)
    end

  end

  describe "self.all" do
    it "must return an array" do
      FarMar::Market.all.must_be_instance_of(Array)

    end

    it "has a Market as its first element" do

      FarMar::Market.all[0].id.must_equal 1
    end

  end

  describe "self.find" do
    it "returns a Market instance" do
      FarMar::Market.find(123).must_be_instance_of(FarMar::Market)
    end
  end

  describe "#vendors" do
    it "returns an Array" do
      my_market.vendors.must_be_instance_of(Array)
    end

    it ""
  end
end
