require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "Oregon").must_be_instance_of(FarMar::Market)
    end

  end

  describe "all" do
    it "returns all instances of Market" do
      FarMar::Market.all.must_include(@id=1, @name="People's Co-op Farmers Market", @address="30th and Burnside", @city="Portland", @county="Multnomah", @state="Oregon", @zip="Oregon")
    end

  end
end
