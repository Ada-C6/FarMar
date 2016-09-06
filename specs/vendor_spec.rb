require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_vendor'#file name(as same as class name)

describe FarMar::Vendor do

  it "loading a vendor csv file creates an array of vendor objects" do
    expect( FarMar::Vendor.all.class ).must_equal(Array)
    expect( FarMar::Vendor.all[0].class ).must_equal(FarMar::Vendor)
  end

  it "Input a vendor id '5' returns the corresponding vendor object" do
     expect(FarMar::Vendor.find("5").class).must_equal(FarMar::Vendor)
  end

end
