require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    it "can initialize a new instance of Market"
    market = FarMar::Market.new("Columbia City")
    market.must_be_instance_of(FarMar::Market)
  end
end
