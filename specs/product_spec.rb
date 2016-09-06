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

end
