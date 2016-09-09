require_relative 'spec_helper'

describe FarMar::Sale do

  describe "#initialize" do
    let(:sales) {FarMar::Sale.new(324, 12.12, 1230, 23, 5)}

    it "should create an instance of Sale" do
        sales.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    let(:fruit) {FarMar::Sale.all}

    it "should return a collection of instances in a hash" do
        fruit.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    let(:fruit) {FarMar::Sale.find(2)}

    it "should return an instance of the object matching the id passed" do
      fruit.id.must_equal(2)
    end
  end

  describe "#vendor" do
    let(:fruit) {FarMar::Sale.find(7)}

    it "should return the vendor associated with that sale" do
      fruit_vendor = FarMar::Vendor.find(1)
      fruit.vendor.must_equal(fruit_vendor)
    end
  end

  describe "#products" do
    let(:fruit) {FarMar::Sale.find(7)}
    
    it "should return the product associated with that sale" do
      fruit_product = FarMar::Product.find(1)
      fruit.product.must_equal(fruit_product)
    end
  end

  describe "self.between(beginning_time, end_time)" do
    it "should return a collection of sales whose purchase time is between both time arguments" do
      morning_sales = FarMar::Sale.between("2013-11-10 04:16:12", "2013-11-13 04:14:40")
      morning_sales.length.must_equal(5146)
    end
  end
end
