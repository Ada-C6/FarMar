require_relative 'spec_helper'

describe FarMar::Product do
	describe "#initialize" do
		it "must create an instance of Product" do
			test_hash = {id: 45, name: "kale", vendor_id: 32}
			product = FarMar::Product.new(test_hash)
			product.must_be_instance_of(FarMar::Product)
		end
	end

	describe "self.all" do
		it "must return a collection of Product instances" do
			products = FarMar::Product.all
			products.first.must_be_instance_of(FarMar::Product)
			products.last.must_be_instance_of(FarMar::Product)
		end
	end

	describe "self.find(id)" do

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Product.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return an instance of Product" do
			FarMar::Product.find(5).must_be_instance_of(FarMar::Product)
		end

		it "must return the right instance of Product" do
			test_find = FarMar::Product.find(5)
			test_find.name.must_equal("Green Apples")
		end
	end

	describe "#vendor" do
		product = FarMar::Product.find(5)

		it "must return an instance of Vendor" do
			product.vendor.must_be_instance_of(FarMar::Vendor)
		end

		it "must return Vendor matching Product instance's vendor_id" do
			product.vendor.id.must_equal(product.vendor_id)
		end
	end
end
