require_relative 'spec_helper'

describe FarMar::Market do
	describe "#initialize" do
		it "must create an instance of Market" do
			test_hash = {
				id: 5,
				name: "Kent Farmers Market",
				address: "2nd Ave N",
				city: "Kent",
				county: "King",
				state: "WA",
				zip: 98032
			}

			market = FarMar::Market.new(test_hash)
			market.must_be_instance_of(FarMar::Market)
		end
	end

	describe "self.all" do
		it "must return a collection of Market instances" do
			markets = FarMar::Market.all
			markets.first.must_be_instance_of(FarMar::Market)
			markets.last.must_be_instance_of(FarMar::Market)
		end
	end
end
