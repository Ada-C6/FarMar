require_relative 'spec_helper'

describe FarMar::Sale do
  before (:each) do
    @sale = FarMar::Sale.new(1,200,"12:00",1,1)
  end

  describe "#initialize" do
    it "should create a new instance of Sale" do
      @sale.must_be_instance_of FarMar::Sale
    end
  end

  describe "#id" do
    it "should have an ID of fixnum type" do
      @sale.id.must_be_kind_of Fixnum
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Sale.all.must_be_kind_of Hash
    end

    it "should have a hash key of \"1\" (as a fixnumx)" do
      hash = FarMar::Sale.all
      hash.has_key?(1).must_equal true
    end
  end

  describe "#self.find" do
    it "should return an instance of Product" do
      FarMar::Sale.find(1).must_be_instance_of FarMar::Sale
    end

    it "should raise an Argument Error if the ID provided isn't in the list" do
      proc { FarMar::Sale.find(0) }.must_raise(ArgumentError)
    end
  end

  describe "#self.between" do
    it "should return an Array" do
      FarMar::Sale.between("2013-11-07 04:34:56 -0800","2013-11-10 02:44:56 -0800").must_be_kind_of Array
    end

    it "should return an instance of Sale" do
      between_test = FarMar::Sale.between("2013-11-07 04:34:56 -0800","2013-11-10 02:44:56 -0800")

      between_test.first.must_be_instance_of FarMar::Sale
    end

    it "should return a 911 sales for given time range" do
      between_test2 = FarMar::Sale.between("2013-11-08 04:31:41 -0800","2013-11-08 16:36:03 -0800")

      between_test2.length.must_equal 911
    end

    it "should raise an ArgumentError if the time range provided never overlaps with the data's range" do
      proc { FarMar::Sale.between("1999-11-08 04:31:41 -0800","1999-11-08 16:36:03 -0800") }.must_raise ArgumentError
    end

    it "should raise an ArgumentError if the first parameter is > the second" do
      proc { FarMar::Sale.between("3000-11-08 04:31:41 -0800","1999-11-08 16:36:03 -0800") }.must_raise ArgumentError
    end
  end

  describe "#vendor" do
    it "should return an instance of vendor" do
      @sale.vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return only one instance, not a collection" do
      @sale.vendor.wont_be_kind_of Hash, Array
    end

    it "should return a vendor_id of 1 with a sale_id of 1" do
      @sale.vendor.id.must_equal 1
    end
  end

  describe "#product" do
    it "should return an instance of Product" do
      @sale.product.must_be_instance_of FarMar::Product
    end

    it "should return only one instance, not a collection" do
      @sale.product.wont_be_kind_of Hash, Array
    end

    it "should return a product_id of 1 with a sale_id of 1" do
      @sale.product.id.must_equal 1
    end
  end
end
