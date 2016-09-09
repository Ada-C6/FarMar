require_relative 'spec_helper'
# require_relative '../Product'
# require_relative '../sale'

describe FarMar::Product do

  p = FarMar::Product.new(2, "name", 1)

  describe "initialize" do
    it "should be an instance of Product" do
      p.must_be_instance_of(FarMar::Product)
    end
  end

  describe "find " do
    product_find = FarMar::Product.find(1)
    it "returns an instance of the object where the value of the id matches" do
      product_find.must_be_kind_of(FarMar::Product)
    end
    it "should inlcude the values 'Dry Beets' " do
      product_find.name.must_equal "Dry Beets"
    end
  end

  describe "vendor" do
    it "should be a kind of Array" do
        p.vendor.must_be_kind_of(Array)
    end
  end

  describe "sales" do
    it "should return a collection of FarMar::Sale instances that are associated
    using the FarMar::Sale product_id" do
        p.sales.length.must_equal(1)
      end
  end

  describe "self.by_vendor" do
    it "should return the products given the vendor information" do
      FarMar::Product.by_vendor(1).each do |line|
        line.vendor_id.must_equal(1)
      end
    end
  end

  describe "number_of_sales" do
    it "should return a Fixnum" do
      p = FarMar::Product.new(2, "name", 2)
      p.number_of_sales.must_be_kind_of(Fixnum)
    end
  end
end
# describe "self.by_vendor(vendor_id)" do
#   it "should returns all of the products with the given vendor_id"
#   FarMar::Product.by_vendor(1)
