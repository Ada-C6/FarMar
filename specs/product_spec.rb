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

  describe "self.find(id)" do
    let(:products) { FarMar::Product.all }

    it "should return a Array" do
      products.must_be_kind_of(Array)
    end
  end
end
