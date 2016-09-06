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


	end
end
