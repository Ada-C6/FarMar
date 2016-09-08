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
		markets = FarMar::Market.all

		it "must return a collection of Market instances" do
			markets.first.must_be_instance_of(FarMar::Market)
			markets.last.must_be_instance_of(FarMar::Market)
		end
	end

	describe "self.find(id)" do

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Market.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return an instance of Market" do
			FarMar::Market.find(5).must_be_instance_of(FarMar::Market)
		end

		it "must return the right instance of Market" do
			test_find = FarMar::Market.find(5)
			test_find.name.must_equal("Quincy Farmers Market")
		end
	end

	describe "#vendors" do
		market = FarMar::Market.find(5)
		vendors = market.vendors
		
		it "must return a collection of Vendor instances" do
			vendors.first.must_be_instance_of(FarMar::Vendor)
		end

		it "must return Vendors which match the Market id" do
			vendors.first.market_id.must_equal(market.id)
			vendors.last.market_id.must_equal(market.id)
		end
	end
end
