require_relative 'spec_helper'
require_relative '../lib/far_mar'
# require_relative '../lib/farmar_vendor'#file name(as same as class name)


# create special csv case to test the 
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

  it "Request top 3 Vendors with highest revenue returns 3 Vendor objects" do
    expect( FarMar::Vendor.most_revenue(3).size ).must_equal(3)
  end
  # should have better test for this one.

  it "Request top 3 Vendors with highest items sold number returns 3 Vendor objects" do
    expect( FarMar::Vendor.most_revenue(3).size ).must_equal(3)
  end
  # should have better test for this one.

  it "The total revenue for '2013-11-07' across all vendors is 8995506.0 cents " do
    expect( FarMar::Vendor.revenue("2013-11-07") ).must_equal(8995506.0)
  end
  #=>8995506.0

  it "returns the total revenue for that specific purchase date and vendor instance" do
    vendor = FarMar::Vendor.new("3", "Breitenberg Inc", "5", "1")
    expect( vendor.revenue("2013-11-13") ).must_equal(9128.0)
  end
  # =>9128.0


end
