require_relative 'spec_helper'
# require '../lib/farmar_vendor'

describe Vendor do

  describe "#initialize" do
    it "should create an instance of Vendor" do
      v = Vendor.new(123, "name", 24, 31)
      v.must_be_instance_of(Vendor)
    end

    it "should know about associated data file" do
      v = Vendor.all
      v.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      v = Vendor.find(5)
      v.must_be_instance_of(Vendor)
      v.employees.must_equal(3)
    end
  end

  describe "#market" do
    it "should return the Market instance associated with this vendor" do
      a = Vendor.new(293,"Kerluke-Denesik",11,54)
      b = a.market
      b.must_be_instance_of(Market)
      b.name.must_equal("Crescent City Farmers Market")
    end
  end

  describe "#products" do
      it "should return a collection of product instances associated by product vendor id" do
        a = Vendor.new(293,"Kerluke-Denesik",11,54)
        b = a.products
        b.class.must_equal(Array)
        b.length.must_equal(4)
      end
  end


end
