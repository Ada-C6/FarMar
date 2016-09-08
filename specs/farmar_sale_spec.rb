require_relative 'spec_helper'

describe FarMar::Sale do
  # would need to change if dataset were to change
  let(:sale) { FarMar::Sale.new({sale_id: 1, sale_amount: 9290, purchase_time: DateTime.parse('2013-11-07 04:34:56 -0800'), vendor_id: 1, product_id: 1, market_zip: 0}) }

  describe "#initialize" do
    # considered with variable dataset in mind
    it "can create a new instance of Sale" do
      sale.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "all" do
    # would need to change if dataset were to change
    it "should put all values of its CSV file into an array" do
      FarMar::Sale.all.length.must_equal(12798)
    end
  end

  describe "find(id)" do
    # would need to change if dataset were to change
    it "should let the user know if the id is not present" do
      proc { FarMar::Sale.find(12002) }.must_raise("ID was not present")
    end

    # would need to change if dataset were to change
    it "should find a specific Sale by the sale_id" do
      FarMar::Sale.all
      found_sale = FarMar::Sale.find(1)
      found_sale.sale_id.must_equal(1)
      found_sale.sale_amount.must_equal(sale.sale_amount)
    end
  end

  describe "#vendor" do
    # would need to change if dataset were to change
    it "return the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
      sale.vendor.must_equal(sale.vendor_name)
    end
  end

  describe "#product" do
    # would need to change if dataset were to change
    it "return the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field" do
      sale.product.must_equal(sale.product_name)
    end
  end

  # describe "#self.between(beginning_time, end_time)" do
  #     # would need to change if dataset were to change
  #   it "should returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
  #   end
  # end
end
