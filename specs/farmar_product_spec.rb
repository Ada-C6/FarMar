require_relative 'spec_helper'

describe FarMar::Product do

  let(:product) { FarMar::Product.new( {product_id: 1, product_name: "Dry Beets",vendor_id: 1} ) }

  describe "#initialize" do

    it "can create a new instance of Product" do
      product.must_be_instance_of(FarMar::Product)
    end

  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      FarMar::Product.all.length.must_equal(8193)
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      proc { FarMar::Product.find(8194) }.must_raise("ID was not present")
    end

    it "should find a specific Product by the market_id" do
      FarMar::Product.all
      found_product = FarMar::Product.find(1)
      found_product.product_id.must_equal(1)
      found_product.product_name.must_equal(product.product_name)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    it "should return all of the products associated with a vendor_id" do
      FarMar::Product.new({product_id: 1, product_name: "Dry Beets",vendor_id: 1})
      FarMar::Product.by_vendor(1).length.must_equal(1)
    end
  end

end
