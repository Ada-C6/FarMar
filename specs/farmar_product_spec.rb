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
    all_products = FarMar::Product.all

    it "should return an array" do
      all_products.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Product instances" do
      all_products[8].must_be_instance_of(FarMar::Product)
    end

    it "should return a collection of FarMar::Product instances created from the CSV file" do
      all_products[6].name.must_equal("Quaint Beef")
    end
  end

  describe "self.find(id)" do
    product_12 = FarMar::Product.find(12)

    it "should return an instance of FarMar::Product" do
      product_12.must_be_instance_of(FarMar::Product)
    end

    it "should return the instance of FarMar::Product that matches the passed id" do
      product_12.id.must_equal(12)
    end

    it "should return the instance of FarMar::Product that matches the passed id, check for name" do
      product_12.name.must_equal("Gorgeous Fish")
    end
  end

  describe "#vendor" do
    before(:each) do
      @fish = FarMar::Product.find(127)
    end

    it "should return an instance of FarMar::Vendor" do
      @fish.vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should return the instance of FarMar::Vendor that matches the Product instance's vendor_id" do
      @fish.vendor.id.must_equal(@fish.vendor_id)
    end

  end

  describe "#sales" do
    before(:each) do
      @greens = FarMar::Product.find(131)
    end

    it "should return an array of FarMar::Sale instances" do
      @greens.sales[1].must_be_instance_of(FarMar::Sale)
    end

    it "should return FarMar::Sale instances that match the product_id" do
      @greens.sales[1].product_id.must_equal(@greens.id)
    end

  end

  describe "#number_of_sales" do
    before(:each) do
      @greens = FarMar::Product.find(131)
    end

    it "should return the number of times this product has been sold" do
      @greens.number_of_sales.must_equal(@greens.sales.length)
    end

  end

  describe "self.by_vendor(vendor_id)" do
    vendor_15_products = FarMar::Product.by_vendor(15)

    it "should return an array of Product instances" do
      vendor_15_products[1].must_be_instance_of(FarMar::Product)
    end

    it "should return the Product instances with vendor_id that matches the passed vendor_id" do
      vendor_15_products[1].vendor_id.must_equal(15)
    end

  end

  # describe "self.most_revenue(n)" do
  #   it "should return the top n product instances ranked by total revenue" do
  #     top_5 = FarMar::Product.most_revenue(5)
  #     (top_5.first > top_5.last).must_equal(true)
  #   end
  # end

  describe "self.find_by_name(name)" do
    it "should return the Product instance that matches the passed name" do
      FarMar::Product.find_by_name("gorgeous fish").id.must_equal(12)
    end
  end

  # describe "self.find_all_by_keyword(word)" do
  #   it "should return an array of Product instances that contain the keyword in the product name" do
  #     matches = FarMar::Product.find_all_by_keyword("fish")
  #     matches[rand(0..(matches.length - 1))].name.must_include("fish")
  #   end
  # end

end
