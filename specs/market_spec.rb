require_relative 'spec_helper'
# require_relative '../lib/market'
# require 'far_mar'

describe FarMar::Market do

  market_hash = {
    id: 123,
    name: "Market",
    address: "123 ererer",
    city: "Seattle",
    county: "King",
    state: "WA",
    zip: 98102
  }

  p = FarMar::Market.new(market_hash)

  describe "initialize" do
    it "should be an instance of Market" do
      p.must_be_instance_of(FarMar::Market)
    end

    # describe "all" do
    #   it "shoud return a hash" do
    #     p.must
    #   end
    # end
  end
end   
