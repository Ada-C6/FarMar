require_relative 'spec_helper'
require_relative '../lib/product'

describe FarMar::Product do
  describe "#initialize" do

    it "can create a new instance of Product" do
      product_hash = FarMar::Product.new("product_hash")
      product_hash.must_be_instance_of(FarMar::Product)
    end

  end

  describe "self.all" do
    let(:products) { FarMar::Product.all }

    it "should return an Array" do
      products.must_be_kind_of(Array)
    end

  end

  describe "self.find(input)" do
    let(:products) { FarMar::Product.find(2) }

    it "should return an instance of FarMar::Product" do
      products.must_be_instance_of(FarMar::Product)
    end

    it "should return a product based on product_id input" do
      products.product_id.must_equal(2)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    before(:each) do
      @products = FarMar::Product.by_vendor(38)
    end

    it "should return an array" do
      @products.must_be_kind_of(Array)
    end

    it "should return all products with a given vendor ID" do
      @products.each do |i|
        i.vendor_id.must_equal(38)
      end
    end
  end

  describe "#vendor" do
    before(:each) do
      @products = FarMar::Product.new({"vendor_id" => 2})
    end

    # The thing to the left of the dot is what is being acted upon by the method
    # to the right of the dot; in this case, passing in only one instance, as
    # defined in before/end
    it "should return an instance of Vendor" do
      @products.vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should use the product's vendor_id to return that product's vendor" do
      @products.vendor.vendor_id.must_equal(2)
    end

  end

end
