require_relative 'spec_helper'

describe Product do
  let all = Product.all
  let prod = Product.new(1,"Dry Beets",1)


  describe "#initialize" do
    it "should create an instance of Product" do
      # p = Product.new(123, "fruits", 12)
      prod.must_be_instance_of(Product)
    end

    it "should know about associated data file" do
      all[4].name.must_equal("Yummy Fruit")
    end
  end

  describe "all" do
    it "should return a hash" do
      all.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      finder = Product.find(11)
      finder.id.must_equal(11)
      finder.must_be_instance_of(Product)
      finder.name.must_equal("Gigantic Bread")
    end
  end

  describe "#vendor" do
    it "should return the Vendor instance that is associated with the product vendor_id" do
      vend = prod.vendor
      vend.must_be_instance_of(Vendor)
      vend.name.must_equal("Feil-Farrell")
    end
  end

  describe "#sales" do
    it "should return a collection of Sale instances that are associated with the Sale product_id field" do
      prod.sales.length.must_equal(7)
    end
  end

  describe "#number_of_sales" do
    it "should return the number of times this product has been sold" do
      prod.number_of_sales.must_equal(7)
    end
  end

  describe "by_vendor" do
    it "should return all products with the given vendor id" do
      Product.by_vendor(4).length.must_equal(3)
    end
  end

end
