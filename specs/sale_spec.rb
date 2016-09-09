require 'time'
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

  describe "self.between(beginning_time, end_time)" do
    let(:matches) { FarMar::Sale.between(Time.new("2013-11-11 11:29:52 -0800"), Time.new("2013-11-13 04:14:40 -0800")) }

    it "should return an array" do
      matches.must_be_kind_of(Array)
    end

    # it "should return the items whose sales time are between the input values" do
    #   sales = FarMar::Sale.all
    #   beginning_time = Time.new("2013-11-11 11:29:52 -0800")
    #   end_time = Time.new("2013-11-13 04:14:40 -0800")
    #   sales.each do |i|
    #     FarMar::Sale.between(beginning_time, end_time).must_include(Time.new("2013-11-12 12:00:35 -0800"))
    #   end
    # end


    it "should return an Array of things between the dates from the CSV file" do
      matches.each do |sale|
        assert_operator Time.new(sale.purchase_time), :>=, Time.new("2013-11-11 11:29:52 -0800")
        assert_operator Time.new(sale.purchase_time), :<=, Time.new("2013-11-13 04:14:40 -0800")
      end
    end




  end
end
