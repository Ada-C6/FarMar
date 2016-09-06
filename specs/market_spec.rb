require_relative 'spec_helper'

describe FarMar::Market do
  market = FarMar::Market.new(0,"Test Market","123 Main St","King", "Seattle", "WA", "98125")

  it "should have an ID of fixnum type" do
    FarMar::Market.id.should_be_kind_of Integer
  end

  describe "#initialize" do
    it "should create a new instance of Market" do
      market.must_be_instance_of FarMar::Market
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Market.all.must_be_kind_of Hash
    end

  end

  describe "#self.find" do
    it "should return an instance of Market" do
      FarMar::Market.find(1).must_be_instance_of Market
    end

    it "should raise an Argument Error if the ID provided isn't in the list" do
      proc { FarMar::Market.find(0) }.must_raise(ArgumentError)
    end


  end

end
