require_relative 'spec_helper'

describe FarMar::Market do

  describe "#initialize" do
    let(:west_seattle) {FarMar::Market.all}

    it "should create an instance of Market" do
      seattle_market = FarMar::Market.new(1, "West Seattle Market", "California & Alaska", "Seattle", "King", "WA", 98116)
      seattle_market.must_be_instance_of(FarMar::Market)
    end

    it "should be able to return Market's name" do
        first = west_seattle[1]
        first.name.must_equal("People's Co-op Farmers Market")
    end
  end
  describe "self.all" do
    let(:west_seattle) {FarMar::Market.all}

    it "should return a collection of instances in a hash" do
        west_seattle.must_be_instance_of(Hash)
    end
  end

  describe "self.find(id)" do
    let(:west_seattle) {FarMar::Market.find(2)}
    
    it "should return an instance of the object matching the id passed" do
      west_seattle.id.must_equal(2)
    end
  end

  describe "#vendors" do
    let(:west_seattle) {FarMar::Market.find(5)}

    it "should return all vendor instances associated with the market's id" do
      west_seattle.vendors.length.must_equal(2)
    end
  end
end
