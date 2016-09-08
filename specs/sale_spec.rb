require_relative 'spec_helper'

describe FarMar::Sale do
	describe "#initialize" do
		it "must create an instance of Sale" do
			test_hash = {id: 23984, amount: 400, purchase_time: "04:34:56 -0800", vendor_id: 1234, product_id: 234}
			sale = FarMar::Sale.new(test_hash)
			sale.must_be_instance_of(FarMar::Sale)
		end
	end

	describe "self.all" do
		sales = FarMar::Sale.all

		it "must return a collection of Sale instances" do
			sales.first.must_be_instance_of(FarMar::Sale)
			sales.last.must_be_instance_of(FarMar::Sale)
		end

#		it "must return a complete collection" do
#			something with length -- how to check length of CSV file?
#		end
	end

	describe "self.find(id)" do

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Sale.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return an instance of Sale" do
			FarMar::Sale.find(5).must_be_instance_of(FarMar::Sale)
		end

		it "must return the right instance of Sale" do
			test_find = FarMar::Sale.find(5)
			test_find.amount.must_equal(4440)
		end
	end

end
