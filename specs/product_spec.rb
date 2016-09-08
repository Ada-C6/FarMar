require_relative 'spec_helper'

describe FarMar::Product do

  describe "#initialize" do
    let (:my_product) {FarMar::Product.new({})}
    it "must create a Product object" do

      my_product.must_be_instance_of(FarMar::Product)
    end

    it "has a name" do
      my_product.must_respond_to :name
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
    # I am assuming at this point that my code is tightly linked to the data
    # files, so I feel OK writing a test that uses the actual data file.
    # Not sure if that is good test writing.
    it "returns an array of Products" do
      FarMar::Product.by_vendor(37).must_be_instance_of Array
      FarMar::Product.by_vendor(37)[0].must_be_instance_of FarMar::Product
      FarMar::Product.by_vendor(34)[0].name.must_equal "Weissnat LLC"
    end
  end

  describe "#vendor" do
    new_product = FarMar::Product.new({vendor_id: 4})
    it "returns the vendor given by product's vendor id" do
      new_product.vendor.id.must_equal 4
      new_product.vendor.must_be_instance_of FarMar::Vendor
    end
  end
end
