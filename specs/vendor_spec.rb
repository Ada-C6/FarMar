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


	describe "self.all" do
		it "must return a collection of Vendor instances" do
			vendors = FarMar::Vendor.all
			vendors.first.must_be_instance_of(FarMar::Vendor)
			vendors.last.must_be_instance_of(FarMar::Vendor)
		end
	end


	describe "self.find(id)" do

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Vendor.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return an instance of Vendor" do
			FarMar::Vendor.find(5).must_be_instance_of(FarMar::Vendor)
		end
	end

end
