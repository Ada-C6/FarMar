require_relative 'spec_helper'

describe FarMar::Market do
  market = FarMar::Market.new(1,"Test Market","123 Main St","King", "Seattle", "WA", "98125")


  describe "#initialize" do
    it "should create a new instance of Market" do
      market.must_be_instance_of FarMar::Market
    end

  end

  describe "#id" do
    it "should have an ID of fixnum type" do
      market.id.must_be_kind_of Fixnum
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Market.all.must_be_kind_of Hash
    end

    it "should have a hash key of \"1\" (as a symbol)" do
      hash = FarMar::Market.all
      hash.has_key?(1).must_equal true
    end
  end

  describe "#self.find" do
    it "should return an instance of Market" do
      FarMar::Market.find(1).must_be_instance_of FarMar::Market
    end

    it "should raise an Argument Error if the ID provided isn't in the list" do
      proc { FarMar::Market.find(0) }.must_raise(ArgumentError)
    end

  end

end
