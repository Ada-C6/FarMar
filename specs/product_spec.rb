require_relative 'spec_helper'

describe FarMar::Product do
  let(:green_apple) {FarMar::Product.find(5)}

  describe "#initialize" do
    let(:fruit) {FarMar::Product.new(123,"Veg Cheez", 5)}

    it "should create an instance of Product" do
        fruit.must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.all" do
    let(:fruit) {FarMar::Product.all}

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    let(:fruit) {FarMar::Product.find(2)}

    it "should return an instance of the object matching the id passed" do
      fruit.id.must_equal(2)
    end
  end

  describe "#vendor" do

    it "should return the vendor instance associated with this product" do
      fruit_vendor = FarMar::Vendor.find(4)
      green_apple.vendor.must_equal(fruit_vendor)
    end
  end

  describe "#sales" do

    it "should return a collection of sales associated with this product" do
      green_apple.sales.length.must_equal(2)
    end
  end

  describe "#number_of_sales" do

    it "should return the number of times the product has been sold" do
      green_apple.number_of_sales.must_equal(2)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    let(:veg_vendor) {FarMar::Product.by_vendor(4)}

    it "should return all of the products associated with that vendor id" do
      veg_vendor.length.must_equal(3)
    end
  end
end
