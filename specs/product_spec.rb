require_relative 'spec_helper'

describe FarMar::Product do
  product = FarMar::Product.new(0,"Test Product",1)

  describe "#initialize" do
    it "should create a new instance of Product" do
      product.must_be_instance_of FarMar::Product
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Product.all.must_be_kind_of Hash
    end
  end

end
