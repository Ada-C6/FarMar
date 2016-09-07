require_relative 'spec_helper'

describe FarMar::Sale do

  # Will need to determine how to format time data into non-String
  # Will need to determine data clean-up steps--add 797 to second listed set of ids, and make 00 be 12002?
  let(:sale) { FarMar::Sale.new({sale_id: 1, sale_amount: 9290, purchase_time: "2013-11-07 04:34:56 -0800", vendor_id: 1, product_id: 1, market_zip: 0}) }

  describe "#initialize" do
    it "can create a new instance of Sale" do
      sale.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "all" do
    it "should put all values of its CSV file into an array" do
      FarMar::Sale.all.length.must_equal(12798)
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      proc { FarMar::Sale.find(12002) }.must_raise("ID was not present")
    end

    it "should find a specific Sale by the sale_id" do
      FarMar::Sale.all
      found_sale = FarMar::Sale.find(1)
      found_sale.sale_id.must_equal(1)
      found_sale.sale_amount.must_equal(sale.sale_amount)
    end
  end
end
