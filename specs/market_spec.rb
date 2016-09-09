require_relative 'spec_helper'

describe FarMar::Market do
	before(:all) do
		@market = FarMar::Market.find(5)
		@vendor_list = @market.vendors
	end

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

			test_market = FarMar::Market.new(test_hash)
			test_market.must_be_instance_of(FarMar::Market)
		end
	end

	describe "self.all" do
		all_markets = FarMar::Market.all

		it "must return a collection of Market instances" do
			all_markets.first.must_be_instance_of(FarMar::Market)
			all_markets.last.must_be_instance_of(FarMar::Market)
		end
	end

	describe "self.find(id)" do

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Market.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return nil if the id doesn't exist" do
			invalid_id = FarMar::Market.find(5000)
			invalid_id.must_equal(nil)
		end

		it "must return an instance of Market" do
			@market.must_be_instance_of(FarMar::Market)
		end

		it "must return the right instance of Market" do
			@market.id.must_equal(5)
		end
	end

	describe "#vendors" do
		it "must return a collection of Vendor instances" do
			@vendor_list.first.must_be_instance_of(FarMar::Vendor)
		end

		it "must return Vendors matching Market id" do
			@vendor_list.first.market_id.must_equal(@market.id)
			@vendor_list.last.market_id.must_equal(@market.id)
		end
	end
end
