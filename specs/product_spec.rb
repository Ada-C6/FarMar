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
    # before (:each) do
    #   @bread = FarMar::Product.new(11, "gigantic bread", 6)
    # end

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
    it "should return a FarMar::Product instance" do
      FarMar::Product.find(15).must_be_kind_of(FarMar::Product)
    end

    it "should return an instance whose id matches that of the id passed into the the parameter" do
      FarMar::Product.find(15).id.must_equal(15)
    end

    it "should raise an error if id parameter is not a fixnum" do
      proc { FarMar::Product.find("15") }.must_raise(ArgumentError)
    end
  end

  describe "#vendor" do
    before (:each) do
      @kale = FarMar::Product.new(14, "curly kale", 8)
    end

    it "should return a FarMar::Vendor instance" do
      @kale.vendor.must_be_kind_of(FarMar::Vendor)
    end

    it "should return a Vendor instance whose id matches the vendor_id of the product the method was called on" do
      @kale.vendor.id.must_equal(@kale.vendor_id)
    end
  end

  describe "#sales" do
    before (:each) do
      @collards = FarMar::Product.new(13, "collard greens", 50)
    end

    it "should return an array" do
      @collards.sales.must_be_kind_of(Array)
    end

    it "should return a collection of FarMar::Sale objects" do
      collard_sales = @collards.sales


      collard_sales.each do |sale|
        sale.must_be_instance_of(FarMar::Sale)
      end
    end

    it "should return a collection of Sale objects who product_ids match the id of the Product the method is called on" do
      collard_sales = @collards.sales
      collard_sales.each do |sale|
        sale.product_id.must_equal(@collards.id)
      end
    end

  end

  describe "#number_of_sales" do
    before (:each) do
        @tomato = FarMar::Product.new(7, "tomato", 47)
    end

    it "should return a number" do
      @tomato.number_of_sales.must_be_kind_of(Fixnum)
    end
  end

  describe "self.by_vendor" do
    it "should return an array" do
      FarMar::Product.by_vendor(20).must_be_kind_of(Array)
    end

    it "should return a collection of FarMar::Product instances" do
      a_vendors_products = FarMar::Product.by_vendor(25)
      a_vendors_products.each do |product|
        product.must_be_instance_of(FarMar::Product)
      end
    end

    it "should return an array of products whose vendor ids match the vendor id passed in" do
      a_vendors_products = FarMar::Product.by_vendor(20)
      a_vendors_products.each do |product|
        produce.vendor_id.must_equal(20)
      end
    end

  end

end
