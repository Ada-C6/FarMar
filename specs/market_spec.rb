# September 8th, 2016
# market_spec.rb
# Minitest for market.rb

require_relative 'spec_helper'
require_relative '../lib/market'

describe 'Testing FarMar market.rb' do

  before do
    @allfile = FarMar::Market.all
  end

  let(:market1) { FarMar::Market.new(["5", "Quincy Farmers Market", "0 Denis Ryan Parkway", "Quincy", "Norfolk", "Massachusetts", "02169"]) }
  let(:market2) { FarMar::Market.new(["11", "Charles Square", "1 Bennett Street,", "Cambridge", "Middlesex", "Massachusetts", "02138"]) }

  it "Test to see if market.rb reads in the file and creates and array of instances in self.all method" do
    expect(@allfile[33].market_id).must_equal("34")
    expect (@allfile[33].name).must_equal("Historic Park Irvine")
    expect(@allfile[33].address).must_equal("1 Irvine Park Rd.")
    expect(@allfile[33].city).must_equal("City of irvine")
    expect(@allfile[31].county).must_equal(nil)
    expect(@allfile[31].state).must_equal("Massachusetts")
    expect(@allfile[31].zip).must_equal("2171")
  end

  it "Test to see if market.rb reads in the file and creates and an instance in self.find method with matching market_id" do
    expect(FarMar::Market.find("28").name).must_equal("Skaneateles Farmers Market")
    expect(FarMar::Market.find("41").name).must_equal("Woodbridge Farmers Market")
    expect(FarMar::Market.find("43").city).must_equal("Waltham")
  end

  it "Test to see if market.rb would return a collection of FarMar::Vendor instances that are associated with the market by the market_id field" do
    expect(market1.vendor.class).must_equal(Array)
    expect(market1.vendor[1].market_id).must_equal("5")
    expect(market1.vendor[0].name).must_equal("Langosh, Krajcik and Langosh")
    expect(market2.vendor[0].num_of_employees).must_equal("10")
  end
end
