require_relative 'spec_helper'
require_relative '../lib/market'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      market_hash = FarMar::Market.new("market_hash")
      market_hash.must_be_instance_of(FarMar::Market)
    end

  end
end
