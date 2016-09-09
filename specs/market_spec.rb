require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "Oregon").must_be_instance_of(FarMar::Market)
    end

  end

  describe "all" do
    it "returns all instances of Market" do
      FarMar::Market.all.length.must_equal(500)
    end
  end

  describe "find" do
    it "returns the instance of Market whose market id matches the argument's market id" do
      this_market = FarMar::Market.find(20)
      this_market.name.must_equal("Scottdale Farmers Market")
    end

    # it "returns that market id does not exist if argument's market id does not match any existing market ids" do
    #
    # end

  end

  describe "#vendors" do
    it "returns collection of vendors associated with that instance of Market" do
      market1 = FarMar::Market.find(3)
      market1.vendors.must_equal(["Kertzmann LLC", "Donnelly-Quigley", "Windler Inc"])
    end
  end
end
