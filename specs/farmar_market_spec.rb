require_relative 'spec_helper'
require_relative '../lib/farmar_market'

describe FarMar::Market do
  describe "#initialize" do
    market = FarMar::Market.new
    it "should create an instance of FarMar::Market class" do
      market.must_be_instance_of(FarMar::Market)
    end
  end
end
