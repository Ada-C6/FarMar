require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_product'#file name(as same as class name)

describe FarMar::Product do

  it "loading a product csv file creates an array of product objects" do
    expect( FarMar::Product.all.class ).must_equal(Array)
    expect( FarMar::Product.all[0].class ).must_equal(FarMar::Product)
  end

  it "Input a product id '5' returns the corresponding product object" do
     expect(FarMar::Product.find("5").class).must_equal(FarMar::Product)
  end

end
