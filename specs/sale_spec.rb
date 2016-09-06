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

end
