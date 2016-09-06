require_relative 'spec_helper'
require 'csv'

describe FarMar::Market do
  describe "#initialize" do
    it "can initialize a new instance of Market" do
      market = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
      market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "#self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Market.all.length.must_equal(500)
    end
  end

  describe "#self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Market.all
      FarMar::Market.find(2).name.must_equal("Silverdale Farmers Market")
    end
  end
end
