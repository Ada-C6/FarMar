require_relative 'spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      sale_hash = FarMar::Sale.new("sale_hash")
      sale_hash.must_be_instance_of(FarMar::Sale)
    end

  end

  describe "self.all" do
    let(:sales) { FarMar::Sale.all }

    it "should return an Array" do
      sales.must_be_kind_of(Array)
    end

  end

  describe "self.find(input)" do
    let(:sales) { FarMar::Sale.find(2) }

    it "should return an instance of FarMar::Sale" do
      sales.must_be_instance_of(FarMar::Sale)
    end

    it "should return a market based on sale_id input" do
      sales.sale_id.must_equal(2)
    end
  end

  describe "#vendor" do
    before(:each) do
      @sale = FarMar::Sale.new({"vendor_id" => 2})
    end

    # The thing to the left of the dot is what is being acted upon by the method
    # to the right of the dot; in this case, passing in only one instance, as
    # defined in before/end
    it "should return an instance of Vendor" do
      @sale.vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should use the sale's vendor_id to return that sale's vendor" do
      @sale.vendor.vendor_id.must_equal(2)
    end
  end

  describe "#product" do
    before(:each) do
      @sales = FarMar::Sale.new({"product_id" => 2})
    end

    it "should return an instance of Vendor" do
      @sales.product.must_be_instance_of(FarMar::Product)
    end

    it "should use the sale's product_id to return that sale's product" do
      @sales.product.product_id.must_equal(2)
    end

  end
end
