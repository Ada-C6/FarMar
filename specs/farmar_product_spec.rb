require_relative 'spec_helper'

describe FarMar::Product do
  # would need to change if dataset were to change
  let(:product) { FarMar::Product.new( {product_id: 1, product_name: "Dry Beets",vendor_id: 1} ) }

  describe "#initialize" do
    # considered with variable dataset in mind
    it "can create a new instance of Product" do
      product.must_be_instance_of(FarMar::Product)
    end

  end

  describe "all" do
    # would need to change if dataset were to change
    it "should put all values of its CSV file into an array" do
      FarMar::Product.all.length.must_equal(8193)
    end
  end

  describe "find(id)" do
    # would need to change if dataset were to change
    it "should let the user know if the id is not present" do
      proc { FarMar::Product.find(8194) }.must_raise("ID was not present")
    end

    # considered with variable dataset in mind
    it "should find a specific Product by the market_id" do
      FarMar::Product.all
      found_product = FarMar::Product.find(1)
      found_product.product_id.must_equal(1)
      found_product.product_name.must_equal(product.product_name)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    # would need to change if dataset were to change
    it "should return all of the products associated with a vendor_id" do
      FarMar::Product.new({product_id: 1, product_name: "Dry Beets",vendor_id: 1})
      FarMar::Product.by_vendor(1).length.must_equal(1)
    end
  end


  describe "#vendor" do
    # would need to change if dataset were to change
    it "should return the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field" do
      FarMar::Vendor.all
      found_vendor= FarMar::Vendor.find(1)
      product.vendor.must_equal(found_vendor.vendor_name)
    end
  end

  describe "#sales" do
    # would need to change if dataset were to change
    it "should returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field" do
      product.sales.length.must_equal(7)
    end
  end

  describe "#number_of_sales" do
    # would need to change if dataset were to change
    it "should return the number of times this product has been sold" do
      product.number_of_sales.must_equal(7)
    end
  end

end
