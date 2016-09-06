require_relative 'spec_helper'
require_relative '../lib/farmar_market'

describe FarMar::Market do
  describe "#initialize" do
    my_hash = {id: 37,
      name: "Guin's Market",
      address: "Ada Dev Academy",
      city: "Seattle",
      county: "King",
      state: "WA",
      zip: "99999"}
    my_market = FarMar::Market.new(my_hash)
    it "must create a Market object" do

      my_market.must_be_instance_of(FarMar::Market)
    end

  end
end
