require_relative 'spec_helper'

describe FarMar::Product do
	before(:all) do
		@product = FarMar::Product.find(5)
	end

	describe "#initialize" do
		it "must create an instance of Product" do
			test_hash = {id: 45, name: "kale", vendor_id: 32}
			test_product = FarMar::Product.new(test_hash)
			test_product.must_be_instance_of(FarMar::Product)
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

		it "must return nil if the id doesn't exist" do
			FarMar::Product.find(50015).must_equal(nil)
		end

		it "must return an instance of Product" do
			FarMar::Product.find(1).must_be_instance_of(FarMar::Product)
		end

		it "must return the right instance of Product" do
			@product.name.must_equal("Green Apples")
		end
	end

	describe "#vendor" do
		it "must return an instance of Vendor" do
			@product.vendor.must_be_instance_of(FarMar::Vendor)
		end

		it "must return Vendor matching Product instance's vendor_id" do
			@product.vendor.id.must_equal(@product.vendor_id)
		end
	end

	describe "#sales" do
		it "must return a collection of Sale instances" do
			@product.sales.first.must_be_instance_of(FarMar::Sale)
			@product.sales.last.must_be_instance_of(FarMar::Sale)
		end

		it "must return Sales with product_id matching Product id" do
			@product.sales.first.product_id.must_equal(@product.id)
			@product.sales.last.product_id.must_equal(@product.id)
		end
	end

	describe "#number_of_sales" do

		product_2 = FarMar::Product.find(4)

		it "must return the number of sales" do
			@product.number_of_sales.must_equal(2)
			product_2.number_of_sales.must_equal(8)
		end
	end

	describe "self.by_vendor(vendor_id)" do
		product_list = FarMar::Product.by_vendor(5)
		it "must return a collection of Product instances" do
			product_list.first.must_be_instance_of(FarMar::Product)
		end

		it "returns Products w/ vendor_id matching the arg" do
			product_list.first.vendor_id.must_equal(5)
			product_list.last.vendor_id.must_equal(5)
		end
	end
end
