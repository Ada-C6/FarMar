require_relative 'spec_helper'

describe FarMar::Market do
  before (:each) do
    @market = FarMar::Market.new(1,"Test Market","123 Main St","King", "Seattle", "WA", "98125")
  end

  describe "#initialize" do
    it "should create a new instance of Market" do
      @market.must_be_instance_of FarMar::Market
    end

  end

  describe "#id" do
    it "should have an ID of fixnum type" do
      @market.id.must_be_kind_of Fixnum
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Market.all.must_be_kind_of Hash
    end

    it "should have a hash key of \"1\" (as a fixnum)" do
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

  describe "#self.search" do
    it "should return a hash" do
      FarMar::Market.search("and").must_be_kind_of Hash
    end

    it "should raise an error if the search word cannot be found" do
      proc { FarMar::Market.search("sdlfjasdlkfj")}.must_raise ArgumentError
    end
  end

  describe "#vendors" do
    it "should return a hash of vendors" do
      @market.vendors.must_be_kind_of Hash
    end

    it "should return a hash of six objects for a market ID of 1" do
      @market.vendors.length.must_equal 6
    end

  end

  describe "#products" do
    it "should return an array" do
      @market.products.must_be_kind_of Array
    end

    it "should return an instance(s) of Product" do
      @market.products.first.must_be_instance_of FarMar::Product
    end
  end

end
