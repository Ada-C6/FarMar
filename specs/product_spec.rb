require_relative 'spec_helper'

describe FarMar::Product do

  describe "#initialize" do
    my_hash = {id: 45,
      name: "Unicorn Meat",
      vendor_id: 120
      }
    let (:my_product) {FarMar::Product.new(my_hash)}
    it "must create a Product object" do

      my_product.must_be_instance_of(FarMar::Product)
    end

    it "has a name" do
      my_product.name.must_equal("Unicorn Meat")
    end
  end

  describe "self.all" do
    it "must return an array" do
      FarMar::Product.all.must_be_instance_of(Array)

    end

    it "has a Product as its first element" do

      FarMar::Product.all[0].must_be_instance_of(FarMar::Product)
    end

  end

  describe "self.find" do
    it "returns a Market instance" do


      FarMar::Product.find(123).must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.by_vendor" do
    it "returns an array of Products" do
      FarMar::Product.by_vendor(37).must_be_instance_of Array
      FarMar::Product.by_vendor(37)[0].must_be_instance_of FarMar::Product
      FarMar::Product.by_vendor(34)[0].name.must_equal "Weissnat LLC"


    end
  end
end
