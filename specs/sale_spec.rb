require_relative 'spec_helper'
require 'csv'

describe FarMar::Sale do

  describe "#initialize" do

    let(:product) { FarMar::Sale.new("12001","8923.0","2013-11-12 02:03:31 -0800","2690","8192") }


    it "can initialize a new instance of Product" do
      product.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Sale.all.length.must_equal(12798)
    end
  end

  describe "self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Sale.all
      FarMar::Sale.find(6666).amount.must_equal("2270")
    end
  end

  describe "#vendor" do
    it "should return the FarMar::Vendor instance associated with the sale" do
      saleinst = FarMar::Sale.new("9","9128","2013-11-13 01:48:15 -0800","3","4")
      saleinst.vendor.name.must_equal("Breitenberg Inc")
    end
  end

  describe "#product" do
    it "should return the FarMar::Product instance associated with the sale" do
      saleinst = FarMar::Sale.new("9","9128","2013-11-13 01:48:15 -0800","3","4")
      saleinst.product.name.must_equal("Yummy Fruit")

    end
  end

  describe "#self.between(beginning_time, end_time)" do
    it "should return a collection of sale items purchase between times" do
      FarMar::Sale.between("2013-11-06 00:00:01 -0800", "2013-11-06 23:59:59 -0800").length.must_equal(1113)
    end
  end

end
