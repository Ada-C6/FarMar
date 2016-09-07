require_relative 'spec_helper'
# require_relative '../lib/market'
# require 'far_mar'

describe FarMar::Market do
  #
  # market_hash = {
  #   id: 123,
  #   name: "Market",
  #   address: "123 ererer",
  #   city: "Seattle",
  #   county: "King",
  #   state: "WA",
  #   zip: 98102
  # }

  # p = FarMar::Market.new(market_hash)
  p = FarMar::Market.new(123, "name", "address", "city", "county", "state", 98102)
  describe "initialize" do
    it "should be an instance of Market" do
      p.must_be_instance_of(FarMar::Market)
    end

    # describe "self.all" do
    #   it "should include" do
    #
    #     FarMar::Market.all.must_include("People's Co-op Farmers Market")
    #   end
    # end
  end
end
