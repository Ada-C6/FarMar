require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do
    test_product = FarMar::Product.new(45, "soap", 1234)

    it "should create a new instance" do
      test_product.must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Product.all.must_be_kind_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object where the value of the id field in the CSV matches the passedparameter" do
      FarMar::Product.find(1).id.must_equal(1)
    end
  end

end
