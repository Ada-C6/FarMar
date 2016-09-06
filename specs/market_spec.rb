require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_market'#file name(as same as class name)

describe FarMar::Market do

  it "loading a market csv file creates an array of market objects" do
    expect( FarMar::Market.all.class ).must_equal(Array)
    expect( FarMar::Market.all[0].class ).must_equal(FarMar::Market)
  end

  it "Input a market id '5' returns the corresponding market object" do
     expect(FarMar::Market.find("5").class).must_equal(FarMar::Market)
  end

end
