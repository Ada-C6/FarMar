require_relative 'spec_helper'


describe FarMar::Sale do
  describe "#initialize" do
    before (:each) do
      @soap_sale = FarMar::Sale.new(33, 8559, "2013-11-11 06:26:33 -0800", 7, 14)
    end

    it "should be able to create a new instance of" do
      @soap_sale.must_be_instance_of(FarMar::Sale)
    end

    it "should have an id property" do
      @soap_sale.must_respond_to(:id)
    end

    it "should have an amount property" do
      @soap_sale.must_respond_to(:amount)
    end

    it "should have an purchase_time property" do
      @soap_sale.must_respond_to(:purchase_time)
    end

    it "should have an vendor_id property" do
      @soap_sale.must_respond_to(:vendor_id)
    end

    it "should have an product_id property" do
      @soap_sale.must_respond_to(:product_id)
    end

  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Sale.all.must_be_kind_of(Array)
    end

    it "should return an array comprised of only FarMar::Sale instances" do
      sale_array = FarMar::Sale.all
      sale_array.each do |sale|
        sale.must_be_kind_of(FarMar::Sale)
      end
    end

    it "should return an array of 12798 sales" do
      product_array = FarMar::Sale.all
      product_array.length.must_equal(12798)
    end
  end

  describe "self.find" do
    it "should return a FarMar::Sale instance" do
      FarMar::Sale.find(10).must_be_kind_of(FarMar::Sale)
    end

    it "should return an instance whose id matches that of the id passed into the the parameter" do
      FarMar::Sale.find(5).id.must_equal(5)
    end

    it "should raise an error if id parameter is not a fixnum" do
      proc { FarMar::Sale.find("15") }.must_raise(ArgumentError)
    end
  end

  describe "#vendor" do
    before (:each) do
      @incense_sale = FarMar::Sale.new(33, 8559, "2013-11-11 06:26:33 -0800", 7, 14)
    end

    it "should return a FarMar::Vendor instance" do
      @incense_sale.vendor.must_be_kind_of(FarMar::Vendor)
    end

    it "should return a Vendor instance whose id matches the vendor_id of the sale the method was called on" do
      @incense_sale.vendor.id.must_equal(@incense_sale.vendor_id)
    end
  end

  describe "#product" do
    before (:each) do
      @incense_sale = FarMar::Sale.new(33, 8559, "2013-11-11 06:26:33 -0800", 7, 14)
    end

    it "should return a FarMar::Product instance" do
      @incense_sale.product.must_be_kind_of(FarMar::Product)
    end

    it "should return a Product instance whose id matches the product_id of the sale the method was called on" do
      @incense_sale.product.id.must_equal(@incense_sale.product_id)
    end
  end

  describe "self.between" do
    right_now = DateTime.now
    past_datetime = DateTime.parse("2013-11-10T22:35:57-08:00")

    it "should return an array" do
      FarMar::Sale.between(past_datetime, right_now).must_be_kind_of(Array)
    end

    it "should return a collection of FarMar::Sale objects" do
      afternoon_sales = FarMar::Sale.between(past_datetime, right_now)
      afternoon_sales.each do |sale|
        sale.must_be_instance_of(FarMar::Sale)
      end
    end

    it "should be made up only of Sale objects whose purchase times are between the beginning_time and end_time arguments" do
      morning_sales = FarMar::Sale.between(past_datetime, right_now)
      morning_sales.each do |sale|
        sale.purchase_time.must_be(:>, past_datetime)
        sale.purchase_time.must_be(:<, right_now)
      end
    end

  end

end
