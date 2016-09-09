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
    it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
      FarMar::Product.find(1).id.must_equal(1)
    end
  end

  describe "self.by_vendor(ven_id)" do
    it "should return True if the correct number of products is returned for the given vendor_id" do
      FarMar::Product.by_vendor(5).length.must_equal(3)
    end

    it "should return a correct product id that is part of the collection returned for the given vendor_id" do
      FarMar::Product.by_vendor(5)[0].id.must_equal(8)
    end
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Productvendor_id field
  describe "#vendor" do
    it "should be true if the FarMar::Vendor instance associated with the FarMar::Product.vendor_id is correct" do
      vendor_test = FarMar::Product.find(4)
      # puts vendor_test.vendor
      vendor_test.vendor.id.must_equal(3)
    end
  end

  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  describe "#sales" do
    let(:sales_test) {FarMar::Product.find(8)}
    it "should be true if the number of FarMar::Sale instances in the collection, associated with the FarMar::Sale.product_id field, is correct" do
      sales_test.sales.length.must_equal(5)
    end

    it "should return a correct sale id that is part of the collection returned for the given product_id" do
      sales_test.sales[0].id.must_equal(23)
    end
  end

  # number_of_sales: returns the number of times this product has been sold.
  describe "#number_of_sales" do
    it "should return true if the number of times this product has been sold is correct." do
      num_sales_test = FarMar::Product.find(4)
      num_sales_test.number_of_sales.must_equal(8)
    end
  end
end
