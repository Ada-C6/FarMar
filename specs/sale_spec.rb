require_relative 'spec_helper'

describe FarMar::Sale do
	before(:all) do
		@sale = FarMar::Sale.find(5)
	end

	describe "#initialize" do
		it "must create an instance of Sale" do
			test_hash = {id: 23984, amount: 400, purchase_time: "04:34:56 -0800", vendor_id: 1234, product_id: 234}
			test_sale = FarMar::Sale.new(test_hash)
			test_sale.must_be_instance_of(FarMar::Sale)
		end
	end

	describe "self.all" do
		sales = FarMar::Sale.all

		it "must return a collection of Sale instances" do
			sales.first.must_be_instance_of(FarMar::Sale)
		end
	end

	describe "self.find(id)" do
		sale_find = FarMar::Sale.find(1)

		it "must take a Fixnum as an argument" do
			bad_args = ["2", "2.4", 2.4, "hat"]

			bad_args.each do |item|
				proc { FarMar::Sale.find(item) }.must_raise(ArgumentError)
			end
		end

		it "must return nil if an id does not exist" do
			FarMar::Sale.find(25380).must_equal(nil)
		end

		it "must return an instance of Sale" do
			sale_find.must_be_instance_of(FarMar::Sale)
		end

		it "must return the right instance of Sale" do
			sale_find.amount.must_equal(9290)
		end
	end

	describe "#vendor" do
		it "must return an instance of Vendor" do
			@sale.vendor.must_be_instance_of(FarMar::Vendor)
		end

		it "must return Vendor matching Sale instance's vendor_id" do
			@sale.vendor.id.must_equal(@sale.vendor_id)
		end
	end

	describe "#product" do
		it "must return an instance of Product" do
			@sale.product.must_be_instance_of(FarMar::Product)
		end

		it "must return product matching Sale instance's product_id" do
			@sale.product.id.must_equal(@sale.product_id)
		end
	end

	describe "self.between(beginning_time, end_time)" do
		sales_in_time = FarMar::Sale.between("2013-11-12 06:03:54 -0800", "2013-11-12 06:33:54 -0800")

		it "must return nil if no sales found" do
			no_sales = FarMar::Sale.between("2013-11-12 06:03:53 -0800", "2013-11-12 06:03:53 -0800")
			no_sales.must_equal(nil)
		end

		it "must return a collection of Sales" do
			sales_in_time.last.must_be_instance_of(FarMar::Sale)
		end

		it "must return all of the sales in that timeframe" do
			sales_in_time.length.must_equal(39)
		end

		# THE TEST BELOW PASSES DESPITE ME DOING *NOTHING*
		# When I run these tests in irb, they return nil
		# The test also still passes when I change the test
		# above to return 'nothing found' instead of nil
		# if there are no sales in the time period.

		# it "must raise an error if the arguments are not valid" do
		# 	bad_args = [["April 5", "May 5"], ["5:00", "7:00"]]
		# 	bad_args.each do |arg|
		# 		proc { FarMar::Sale.between(arg[0], arg[1]).must_raise(ArgumentError) }
		# 	end
		# end

		# Other issues:
		# if a date with no timezone is passed in, it
		# defaults to +00:00. I have no idea how to
		# manipulate this and alter the timezone so
		# that it is always -0800.
	end
end
