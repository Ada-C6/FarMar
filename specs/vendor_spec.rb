require_relative 'spec_helper'
require_relative '../far_mar'

describe FarMar::Product do
	describe "#initialize" do
		it "must create an instance of Vendor" do
			test_hash = {id: 12, name: "Kent Vegetables", employees: 6, market_id: 5}
			vendor = FarMar::Vendor.new(test_hash)
			vendor.must_be_instance_of(FarMar::Vendor)
		end
	end
end
