require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    greenlake = FarMar::Market.new(123, "greenlake", "123 green", "Green Lake", "Seattle", "WA", "98105")

    it "should create a new instance" do
      greenlake.must_be_instance_of(FarMar::Market)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Market.all.must_be_kind_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object where the value of the id field in the CSV matches the passedparameter" do
      FarMar::Market.find(1).id.must_equal(1)
    end
  end

  describe "#vendors" do
    it "should return a the correct number of FarMar::Vendor instances that are associated with the market instance" do
      market_test = FarMar::Market.find(2)
      market_test.vendors.length.must_equal(3)
    end

    it "should return true if the correct number of FarMar::Vendor instances that are associated with the market instance are returned by the indstance method" do
      market_test2 = FarMar::Market.find(1)
      market_test2.vendors.length.must_equal(6)
    end
  end
end
