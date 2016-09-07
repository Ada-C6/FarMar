require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_sale'#file name(as same as class name)

describe FarMar::Sale do

  it "loading a sale csv file creates an array of sale objects" do
    expect( FarMar::Sale.all.class ).must_equal(Array)
    expect( FarMar::Sale.all[0].class ).must_equal(FarMar::Sale)
  end

  it "Input a sale id '5' returns the corresponding sale object" do
     expect(FarMar::Sale.find("5").class).must_equal(FarMar::Sale)
  end

  it "Input a sale id '1', returns all the corresponding Vendor objects with the same Sale's vendor id" do
    sale = FarMar::Sale.new("1",9290,"2013-11-07 04:34:56 -0800","1","1")
    expect( sale.vendor.class ).must_equal(Array)
    expect( sale.vendor[0].class ).must_equal(FarMar::Vendor)
  end

  it "Input a sale id '1', returns all the corresponding Product objects with the same Sale's product id" do
    sale = FarMar::Sale.new("1",9290,"2013-11-07 04:34:56 -0800","1","1")
    expect( sale.product.class ).must_equal(Array)
    expect( sale.product[0].class ).must_equal(FarMar::Product)
  end

  # Will make tests with more fun and meaning from now on. :D
  it "Given a beginning time: 2013-11-03 04:34:56 -0800 and a end time: 2013-11-03 05:14:56 -0900, there are 12798 number of Sale objects with purchase time that fall between the period " do
    expect ( FarMar::Sale.between("2013-11-03 04:34:56 -0800","2013-11-03 05:14:56 -0900").size ). must_equal(12798)
  end

end
