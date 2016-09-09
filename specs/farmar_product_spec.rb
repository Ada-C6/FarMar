# Talked to TA Friday afternoon re: spec tests not so helpful--could have included sub data (such as a custom csv file just for testing purposes) to create spec tests to target certain numbers of data (such as all expected items in a collection making it into the collection.)

require_relative 'spec_helper'

describe FarMar::Product do
  before (:each) do
    @all_products = FarMar::Product.all
    product_hash = {}
    product_csv_file = CSV.read("../FarMar/support/products.csv")
    product_csv_file.each do |product|
      product_hash[:product_id] = product[0].to_i
      product_hash[:product_name] = product[1].to_s
      product_hash[:vendor_id] = product[2].to_i
    end
    @product= FarMar::Product.new(product_hash)
  end

  describe "#initialize" do
    it "can create a new instance of Product" do
      @product.must_be_instance_of(FarMar::Product)
    end

  end

  describe "all" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should put all values of its CSV file into an array" do
      @all_products.wont_be_empty
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      test_hash = {}
      test_hash[:product_id] = @all_products.length + 1
      test_hash[:product_name] = "Test"
      test_hash[:vendor_id] = 1

      test_product = FarMar::Product.new(test_hash)

      proc { FarMar::Product.find(test_product.product_id) }.must_raise("ID was not present")
    end

    # would need to change if dataset were to change
    it "should find a specific Product by the product_id" do
      found_product = FarMar::Product.find(@product.product_id)
      found_product.product_id.must_equal(@product.product_id)
      found_product.product_name.must_equal(@product.product_name)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return all of the products associated with a vendor_id" do
      FarMar::Product.by_vendor(@product.vendor_id).wont_be_empty
    end
  end


  describe "#vendor" do
    it "should return the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field" do
      found_vendor= FarMar::Vendor.find(@product.vendor_id)
      @product.vendor.must_equal(found_vendor.vendor_name)
    end
  end

  describe "#sales" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field" do
      @product.sales.wont_be_empty
    end
  end

  describe "#number_of_sales" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should return the number of times this product has been sold" do
      @product.number_of_sales.must_be_instance_of(Fixnum)
    end
  end

end
