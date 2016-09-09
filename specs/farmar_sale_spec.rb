require_relative 'spec_helper'

describe FarMar::Sale do
  before (:each) do
    @all_sales = FarMar::Sale.all
    sale_hash = {}
    sale_csv_file = CSV.read("../FarMar/support/sales.csv")
    sale_csv_file.each do |sale|
      sale_hash[:sale_id] = sale[0].to_i
      sale_hash[:sale_amount] = sale[1].to_i
      sale_hash[:sale_purchase_time] = DateTime.parse(sale[2])
      sale_hash[:vendor_id] = sale[3].to_i
      sale_hash[:product_id] = sale[4].to_i
    end
    @sale = FarMar::Sale.new(sale_hash)
  end

  describe "#initialize" do
    it "can create a new instance of Sale" do
      @sale.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "all" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should put all values of its CSV file into an array" do
      @all_sales.wont_be_empty
    end
  end

  describe "find(id)" do
    it "should let the user know if the id is not present" do
      test_hash = {}
      test_hash[:sale_id] = @all_sales.length + 1
      test_hash[:sale_amount] = "Test"
      test_hash[:sale_purchase_time] = '2013-11-07 23:58:00 -0800'
      test_hash[:vendor_id] = 0
      test_hash[:product_id] = 0

      proc { FarMar::Sale.find(sale_id) }.must_raise("ID was not present")
    end

    it "should find a specific Sale by the sale_id" do
      found_sale = FarMar::Sale.find(@sale.sale_id)
      found_sale.sale_id.must_equal(@sale.sale_id)
      found_sale.sale_amount.must_equal(@sale.sale_amount)
    end
  end

  describe "#vendor" do
    it "return the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
      found_vendor = FarMar::Vendor.find(@sale.vendor_id)
      @sale.vendor.must_equal(found_vendor.vendor_name)
    end
  end

  describe "#product" do
    it "return the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field" do
      FarMar::Product.all
      found_product = FarMar::Product.find(@sale.product_id)
      @sale.product.must_equal(found_product.product_name)
    end
  end

  describe "#self.between(beginning_time, end_time)" do
    # if time after total refactoring, would like to see if there's additional things to check to make this more useful
    it "should returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
      test_start = '2013-11-07 23:58:00 -0800'
      test_end = '2013-11-07 23:59:59 -0800'
      FarMar::Sale.between(test_start, test_end).wont_be_empty
    end
  end
end
