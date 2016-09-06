require_relative 'spec_helper'

describe FarMar::Product do
  product = FarMar::Product.new(1,"Test Product",1)

  describe "#initialize" do
    it "should create a new instance of Product" do
      product.must_be_instance_of FarMar::Product
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Product.all.must_be_kind_of Hash
    end

    it "should have a hash key of \"1\" (as a fixnum)" do
      hash = FarMar::Product.all
      hash.has_key?(1).must_equal true
    end
  end

  describe "#self.find" do
    it "should return an instance of Product" do
      FarMar::Product.find(1).must_be_instance_of FarMar::Product
    end

    it "should raise an Argument Error if the ID provided isn't in the list" do
      proc { FarMar::Product.find(0) }.must_raise(ArgumentError)
    end
  end
end
