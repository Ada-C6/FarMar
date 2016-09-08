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

		it "must return the right instance of Vendor" do
			test_find = FarMar::Vendor.find(5)
			test_find.name.must_equal("Reynolds, Schmitt and Klocko")
		end
	end

	describe "#market" do
		vendor = FarMar::Vendor.find(5)

		it "must return a Market instance" do
			vendor.market.must_be_instance_of(FarMar::Market)
		end

		it "must return the Market which matches Vendor market_id" do
			vendor.market.id.must_equal(vendor.market_id)
		end
	end

	describe "#products" do
		vendor = FarMar::Vendor.find(5)
		product_list = vendor.products

		it "must return a collection of Product instances" do
			product_list.first.must_be_instance_of(FarMar::Product)
		end

		it "must return Products with matching Vendor id" do
			product_list.first.vendor_id.must_equal(vendor.id)
			product_list.last.vendor_id.must_equal(vendor.id)
		end
	end

	describe "#sales" do
		vendor = FarMar::Vendor.find(5)
		sales_list = vendor.sales

		it "must return a collection of Sale instances" do
			sales_list.first.must_be_instance_of(FarMar::Sale)
		end

		it "must return Sales with matching Vendor id" do
			sales_list.first.vendor_id.must_equal(vendor.id)
		end
	end

	describe "#revenue" do
		vendor = FarMar::Vendor.find(5)

		# There should be a better test for this. What if
		# the data gets updated with more sales? Then this
		# test will break.
		it "must return the total amount of sales" do
			vendor.revenue.must_equal(61749)
		end
	end

	describe "self.by_market(market_id)" do
		vendor_list = FarMar::Vendor.by_market(5)
		it "must return instances of Vendors" do
			vendor_list.first.must_be_instance_of(FarMar::Vendor)
		end

		it "returns Vendors w/ market_id matching the arg" do
			vendor_list.first.market_id.must_equal(5)
			vendor_list.last.market_id.must_equal(5)
		end
	end
end
