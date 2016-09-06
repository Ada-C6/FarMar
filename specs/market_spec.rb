require_relative 'spec_helper'
require_relative '../lib/market.rb'

describe FarMar::Market do
  describe "#initialize" do

    it "should create a new instance of Market" do
      pvd_market = FarMar::Market.new
      pvd_market.must_be_instance_of(FarMar::Market)
    end

  end
end
