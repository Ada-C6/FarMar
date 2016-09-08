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
  end
end
