require_relative 'spec_helper'
require_relative '../lib/far_mar'
# require_relative '../lib/farmar_product'#file name(as same as class name)

describe FarMar::Product do

  it "loading a product csv file creates an array of product objects" do
    expect( FarMar::Product.all.class ).must_equal(Array)
    expect( FarMar::Product.all[0].class ).must_equal(FarMar::Product)
  end

  it "Input a product id '5' returns the corresponding product object" do
     expect(FarMar::Product.find("5").class).must_equal(FarMar::Product)
  end

  it "Input a vendor id '1', returns all the corresponding Product objects with the same vendor id" do
    expect( FarMar::Product.by_vendor("1").class ).must_equal(Array)
    expect( FarMar::Product.by_vendor("1")[0].class ).must_equal(FarMar::Product)
  end

  it "Input a product id '1', returns all the corresponding Vendor objects with the same Product's vendor id" do
    product = FarMar::Product.new("1","Dry Beets","1")
    expect( product.vendor.class ).must_equal(FarMar::Vendor)
  end

  it "Input a product id '1' returns all the corresponding Sale objects with the same product id" do
    product = FarMar::Product.new("1","Dry Beets","1")
    expect( product.sales.class ).must_equal(Array)
    expect( product.sales[0].class ).must_equal(FarMar::Sale)
  end

  it "There is no corresponding Sale objects with a product id '3'" do
    product = FarMar::Product.new("3","Heavy Chicken","2")
    expect( product.sales.class ).must_equal(Array)
    expect( product.sales[0].class).must_equal(NilClass)
  end

  it "The product with id '1' has been sold 7 times" do
    product = FarMar::Product.new("1","Dry Beets","1")
    expect( product.number_of_sales ).must_equal(7)
  end

  it "The top 3 Product object ranked by total revenue has 3 objects" do
    expect( FarMar::Product.most_revenue(3).size ).must_equal(3)
  end



end
