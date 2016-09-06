require_relative 'spec_helper'

describe FarMar::Market do

  let(:market) { FarMar::Market.new }

  describe "#initialize" do

    it "can create a new instance of Market" do
      market.must_be_instance_of(FarMar::Market)
    end

    it "should know about its related CSV file" do
      market.market_csv.wont_be_empty
    end
  end
end
