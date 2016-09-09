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
    it "returns the instance of Product whose product id matches the argument's product id" do
      this_product = FarMar::Product.find(8162)
      this_product.name.must_equal("Long Chicken")
    end
  end

  describe "by_vendor" do
    it "returns all names of Product instances associated with the argument's vendor id" do
      FarMar::Product.by_vendor(10).must_equal(["Calm Carrots", "Fierce Beef", "Helpless Bread", "Yummy Bread", "Broken Beets"])
    end
  end

  describe "#vendor" do
    it "returns the instance of Vendor associated with that instance of Product" do
      this_product = FarMar::Product.find(250)
      this_product.vendor.id.must_be_same_as(FarMar::Vendor.find(78).id)
    end
  end

  describe "#sales" do
    it "returns the sale ids of all instances of Sale associated with that instance of Product" do
      my_product = FarMar::Product.find(378)
      my_product.sales.must_equal([560, 562, 564, 566, 568])
    end
  end

  describe "#number_of_sales" do
    it "returns the total number of instances of Sale associated with that instance of Product" do
      product = FarMar::Product.find(450)
      product.number_of_sales.must_equal(2)
    end
  end

end
