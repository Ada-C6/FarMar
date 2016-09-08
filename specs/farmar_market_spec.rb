require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    market = FarMar::Market.new(5, "Columbia City Farmers Market", "40 S Edmunds Rd", "Seattle", "King", "WA", "98118")

    it "should create an instance of FarMar::Market class" do
      market.must_be_instance_of(FarMar::Market)
    end

    it "should pass 7 arguments: ID - (Fixnum), Name - (String), Address - (String), City - (String), County - (String), State - (String), Zip - (String) and allow reading of ID" do
      market.id.must_equal(5)
    end

  end

  describe "self.all" do
    all_markets = FarMar::Market.all

    it "should return an array" do
      all_markets.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Market instances" do
      all_markets[8].must_be_instance_of(FarMar::Market)
    end

    it "should return a collection of FarMar::Market instances created from the CSV file" do
      all_markets[6].name.must_equal("Petaluma Evening Farmers' Market")
    end
  end

  describe "self.find(id)" do
    market_12 = FarMar::Market.find(12)

    it "should return an instance of FarMar::Market" do
      market_12.must_be_instance_of(FarMar::Market)
    end

    it "should return the instance of FarMar::Market that matches the passed id" do
      market_12.id.must_equal(12)
    end

    it "should return the instance of FarMar::Market that matches the passed id, check for name" do
      market_12.name.must_equal("Coxsackie Farmers' Market")
    end

  end

  describe "#market" do
    silverdale = FarMar::Market.find(2)

    it "should return a collection of FarMar::Vendor instances associated with the market" do
      silverdale.market.must_be_kind_of(Array)
    end

    it "should return an array of the vendors associated with silverdale market" do
      vendors = silverdale.market
      vendor_names = vendors.map do |vendor|
        vendor.name
      end
      vendor_names.must_include("Quigley, Breitenberg and Schuster")
    end
  end

  describe "find_by_name(name)" do
    it "should return the instance that matches the passed name" do
      FarMar::Market.find_by_name("Coxsackie Farmers' Market").id.must_equal(FarMar::Market.find(12).id)
    end

  end

  describe "find_all_by_state(state)" do
    it "should return an array of instances that match the passed state" do
      markets_wa = FarMar::Market.find_all_by_state("Washington")

      markets_wa[rand(1..(markets_wa.length - 1))].state.upcase.must_equal("WASHINGTON")

    end
  end

end
