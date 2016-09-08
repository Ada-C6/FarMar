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

  it "Input a market id '2' returns all the corresponding vendor objects with the same market id" do
    market = FarMar::Market.new("2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383")
    expect( market.vendors.class ).must_equal(Array)
    expect( market.vendors[0].class ).must_equal(FarMar::Vendor)
  end

  it "There are 3 Product objects associated with market id '2'" do
    market = FarMar::Market.new("2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383")
    expect( market.products("2").size).must_equal(3)
  end

  it "There are 3 Market objects that have 'school' in either in its market name or its vendor name" do
    expect(FarMar::Market.search("school").size).must_equal(3)
  end

  it "Input a market id '2' returns and return the vendor who has highest revenue(prefered vendor) of that market" do
    market = FarMar::Market.new("2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383")
    expect( market.prefered_vendor.class ).must_equal(FarMar::Vendor)
  end




end
