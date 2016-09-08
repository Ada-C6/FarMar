require_relative 'spec_helper'

describe FarMar::Sale do

  describe "#initialize" do
    sale = FarMar::Sale.new(9, 500, Time.now, 4, 100)

    it "should create an instance of FarMar::Sale class" do
      sale.must_be_instance_of(FarMar::Sale)
    end

    it "should pass 5 arguments: ID - (Fixnum), Amount - (Fixnum), Purchase_time - (Datetime), Vendor_id - (Fixnum), Product_id - (Fixnum) and allow reading of ID" do
      sale.id.must_equal(9)
    end

  end

  describe "self.all" do
    before (:each) do
      @all_sales = FarMar::Sale.all
    end

    it "should return an array" do
      @all_sales.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Sale instances" do
      @all_sales[8].must_be_instance_of(FarMar::Sale)
    end

    it "should return a collection of FarMar::Sale instances created from the CSV file" do
      @all_sales[6].amount.must_equal(4095)
    end
  end

  describe "self.find(id)" do
    before(:each) do
      @sale_12 = FarMar::Sale.find(12)
    end

    it "should return an instance of FarMar::Sale" do
      @sale_12.must_be_instance_of(FarMar::Sale)
    end

    it "should return the instance of FarMar::Sale that matches the passed id" do
      @sale_12.id.must_equal(12)
    end

    it "should return the instance of FarMar::Sale that matches the passed id, check for amount" do
      @sale_12.amount.must_equal(5179)
    end

  end

  describe "#vendor" do
    before(:each) do
      @sale = FarMar::Sale.find(38)
    end

    it "should return a FarMar::Vendor instance" do
      @sale.vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should return the Vendor instance that matches the vendor_id of the Product instance" do
      @sale.vendor.id.must_equal(@sale.vendor_id)
    end

  end

  describe "#product" do
    before(:each) do
      @sale = FarMar::Sale.find(38)
    end

    it "should return a FarMar::Product instance" do
      @sale.product.must_be_instance_of(FarMar::Product)
    end

    it "should return the Product instance associated with sale using Sale product_id" do
      @sale.product.id.must_equal(@sale.product_id)
    end

  end

  describe "self.between(beginning_time, end_time)" do
    beginning_time = DateTime.new(2013, 11, 07, 20, 25, 00, '-8')
    end_time = DateTime.new(2013, 11, 07, 20, 26, 00, '-8')
    sales = FarMar::Sale.between(beginning_time, end_time)
    it "should return an array of FarMar::Sale objects" do
      sales[1].must_be_instance_of(FarMar::Sale)
    end

    it "should return an array of Sale objects that were sold between the two times given" do
      sales_ids = sales.map do |sale|
        sale.id
      end
      sales_ids.must_include(37)
    end
  end
end
