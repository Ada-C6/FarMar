require_relative 'spec_helper'
require 'csv'

describe FarMar::Product do
  describe "#initialize" do
    it "can initialize a new instance of Product" do
      product = FarMar::Product.new("1","Dry Beets","1")
      product.must_be_instance_of(FarMar::Product)
    end
  end

  describe "#self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Product.all.length.must_equal(8193)
    end
  end

  describe "#self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Product.all
      FarMar::Product.find(8166).name.must_equal("Faithful Apples")
    end
  end
end
