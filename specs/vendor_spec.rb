require_relative 'spec_helper'

describe FarMar::Vendor do
	describe "#initialize" do
		it "must create an instance of Vendor" do
			test_hash = {
				id: 12,
				name: "Kent Vegetables",
				employees: 6,
				market_id: 5
			}

			vendor = FarMar::Vendor.new(test_hash)
			vendor.must_be_instance_of(FarMar::Vendor)
		end
	end


# This might be reaaally slow on a much larger dataset. Maybe just look
# at a few of them?
	describe "self.all" do
		it "must return a collection of Vendor instances" do
			vendors = FarMar::Vendor.all
			vendors.first.must_be_instance_of(FarMar::Vendor)
			vendors.last.must_be_instance_of(FarMar::Vendor)
		end
	end
end
