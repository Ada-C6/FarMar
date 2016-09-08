require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_vendor'#file name(as same as class name)

describe FarMar::Vendor do

  it "loading a vendor csv file creates an array of Vendor objects" do
    expect( FarMar::Vendor.all.class ).must_equal(Array)
    expect( FarMar::Vendor.all[0].class ).must_equal(FarMar::Vendor)
  end

  it "Input a vendor id '5' returns the corresponding Vendor object" do
     expect(FarMar::Vendor.find("5").class).must_equal(FarMar::Vendor)
  end

  it "Input a market id '3' returns all the corresponding Market objects with the same market id" do
    vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
    expect( vendor.market.class ).must_equal(FarMar::Market)
  end

  it "Input a vendor id '3' returns all the corresponding Product objects with the same vendor id" do
    vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
    expect( vendor.products.class ).must_equal(Array)
    expect( vendor.products[0].class ).must_equal(FarMar::Product)
  end

  it "Input a vendor id '3' returns all the corresponding Sale objects with the same vendor id" do
    vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
    expect( vendor.sales.class ).must_equal(Array)
    expect( vendor.sales[0].class ).must_equal(FarMar::Sale)
  end

  it "Revenue of vendor 'Breitenberg Inc' is 40126.0 cents" do
    vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
    expect( vendor.revenue ).must_equal(40126.0)
  end

  it "Input a market id'1', returns all the corresponding Vendor objects with the same market id" do
    expect( FarMar::Vendor.by_market("1").class ).must_equal(Array)
    expect( FarMar::Vendor.by_market("1")[0].class ).must_equal(FarMar::Vendor)
  end

end
