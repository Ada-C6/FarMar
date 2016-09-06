require_relative 'spec_helper'
require_relative '../lib/farmar_market'

describe FarMar::Market do
	describe "#initialize" do
		it "must create an instance of Market" do
			test_hash = {id: 5, name: "Kent Farmers Market", address: "2nd Ave N", city: "Kent", county: "King", state: "WA", zip: 98032}
			market = FarMar::Market.new(test_hash)
			market.must_be_instance_of(FarMar::Market)
		end
	end
end
