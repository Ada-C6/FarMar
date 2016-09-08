require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do
    before (:each) do
      @soap = FarMar::Product.new(9, "savory soap", 5)
    end

    it "should be able to create a new instance of Product" do
      @soap.must_be_instance_of(FarMar::Product)
    end

    it "should have an id property" do
      @soap.must_respond_to(:id)
    end

    it "should have a name property" do
      @soap.must_respond_to(:name)
    end

    it "should have a vendor_id property" do
      @soap.must_respond_to(:vendor_id)
    end

    # it "should initialize with an id that is a fixnum" do
    #
    # end
    #
    # it "should initialize with a name that is a string" do
    #
    # end
    #
    # it "should initialize with a vendor_id that is fixnum" do
    #
    # end
  end

  describe "self.all" do
    before (:each) do
      @bread = FarMar::Product.new(11, "gigantic bread", 6)
    end

    it "should return an array" do
      FarMar::Product.all.must_be_kind_of(Array)
    end

    it "should return an array comprised of only FarMar::Product instances" do
      product_array = FarMar::Product.all
      product_array.each do |product|
        product.must_be_kind_of(FarMar::Product)
      end
    end

    it "should return an array of 8193 products" do
      product_array = FarMar::Product.all
      product_array.length.must_equal(8193)
    end
  end

  describe "self.find" do
    before (:each) do

    end

    it "should return a FarMar::Product instance" do

    end

    it "should return an instance whose id matches that of the id passed into the the parameter" do

    end

    it "should be invoked with a fixnum passed into the parameter" do
      
    end
  end















end
