require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do
    product = FarMar::Product.new(2, "Jelly beans", 4)

    it "should create an instance of FarMar::Product class" do
      product.must_be_instance_of(FarMar::Product)
    end

    it "should pass 3 arguments: ID - (Fixnum), Name - (String), Vendor_id - (Fixnum) and allow reading of ID" do
      product.id.must_equal(2)
    end

  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Product.all.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Product instances" do
      FarMar::Product.all[8].must_be_instance_of(FarMar::Product)
    end

    it "should return a collection of FarMar::Product instances created from the CSV file" do
      FarMar::Product.all[6].name.must_equal("Quaint Beef")
    end
  end

  describe "self.find(id)" do
    it "should return an instance of FarMar::Product" do
      FarMar::Product.find(12).must_be_instance_of(FarMar::Product)
    end

    it "should return the instance of FarMar::Product that matches the passed id" do
      FarMar::Product.find(12).id.must_equal(12)
    end

    it "should return the instance of FarMar::Product that matches the passed id, check for name" do
      FarMar::Product.find(127).name.must_equal("Helpful Fish")
    end

  end
end
