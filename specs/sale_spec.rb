require_relative 'spec_helper'
require 'csv'

describe FarMar::Sale do
  describe "#initialize" do
    it "can initialize a new instance of Product" do
      product = FarMar::Sale.new("12001","8923.0","2013-11-12 02:03:31 -0800","2690","8192")
      product.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "#self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Sale.all.length.must_equal(12798)
    end
  end

  describe "#self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Sale.all
      FarMar::Sale.find(6666).amount.must_equal("2270")
    end
  end
end
