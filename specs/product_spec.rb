require_relative 'spec_helper'

describe FarMar::Product do

  describe "#initialize" do
    it "can create a new instance of Product" do
      FarMar::Product.new(8090, "Sour Beets",2657).must_be_instance_of(FarMar::Product)
    end
  end

  describe "all" do
    it "returns all instances of Product" do
    FarMar::Product.all.length.must_equal(8193)
    end
  end

  describe "find" do
    it "returns the instance of Product whose product id matches the argument product id" do
      this_product = FarMar::Product.find(8162)
      this_product.name.must_equal("Long Chicken")
    end
  end

end
