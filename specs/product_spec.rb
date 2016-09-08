require_relative 'spec_helper'

describe FarMar::Product do
  before (:each) do
    @product = FarMar::Product.new(1,"Test Product",1)
  end

  describe "#initialize" do
    it "should create a new instance of Product" do
      @product.must_be_instance_of FarMar::Product
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

  describe "#vendor" do
    it "should return an instance of Vendor" do
      @product.vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return only one instance, not a collection" do
      @product.vendor.wont_be_kind_of Hash, Array
    end
  end

  describe "#sales" do
    it "should return a hash" do
      @product.sales.must_be_kind_of Hash
    end

    it "should return a hash with length of 7 for product ID of 1" do
      @product.sales.length.must_equal 7
    end
  end

  describe "#number_of_sales" do
    it "should return a single fixnum" do
      @product.number_of_sales.must_be_kind_of Fixnum
    end

    it "should return 7 for amount of product id 1s sold" do
      @product.number_of_sales.must_equal 7
    end
  end
end
