require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    before (:each) do
      @vendor = FarMar::Vendor.new(13, "Gene Ric Farms", 4, 5)
    end

    it "should be able to create a new instance of Vendor" do
      @vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should have an id property" do
      @vendor.must_respond_to(:id)
    end

    #test to see that an instance of FarMar::Vendor has name, no_of_employees,
    #and market_id properties as well
  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Vendor.all.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Vendor objects" do
      vendors = FarMar::Vendor.all
      vendors[0].must_be_kind_of(FarMar::Vendor)
    end

    it "should return an array of 2690 instances" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "self.find" do
    it "should return a FarMar::Vendor object" do
      FarMar::Vendor.find(300).must_be_kind_of(FarMar::Vendor)
    end
  end

  describe "#market" do
    before (:each) do
      @vendor = FarMar::Vendor.new(13, "Gene Ric Farms", 4, 5)
    end

    it "should return a FarMar::Market instance" do
      @vendor.market.must_be_kind_of(FarMar::Market)
    end

    it "should return a Market instance whose id matches the market_id of the vendor the method was called on" do
      @vendor.market.id.to_i.must_equal(@vendor.market_id)
    end
  end

  describe "#products" do
    before (:each) do
      @windler = FarMar::Vendor.new(12, "Windler Inc", 4, 3)
    end

    it "should return an array" do
      @windler.products.must_be_kind_of(Array)
    end

    it "should return an array made up of FarMar::Product instances" do
      products_list = @windler.products
      products_list.each do |product|
        product.must_be_instance_of(FarMar::Product)
      end
    end

    it "should have only FarMar::Product instances whose vendor id matches the vendor the method is called on" do
      products_list = @windler.products
      products_list.each do |product|
        product.vendor_id.must_equal(@windler.id)
      end
    end
  end

  describe "#sales" do
    before (:each) do
      @bread_vendor = FarMar::Vendor.new(6, "Zulauf and Sons", 8, 1)
    end

    it "should return an array" do
      @bread_vendor.sales.must_be_kind_of(Array)
    end

    it "should return a collection of FarMar::Sale instances" do
      a_vendors_sales_list = @bread_vendor.sales
      a_vendors_sales_list.each do |sale|
        sale.must_be_instance_of(FarMar::Sale)
      end
    end

    # it "should return a collection of Sale instances whose vendor_ids match the id of the vendor the method is called on" do
    #
    # end
  end

  describe "#revenue" do
    before (:each) do
      @bread_vendor = FarMar::Vendor.new(6, "Zulauf and Sons", 8, 1)
    end

    it "should return a number" do
      @bread_vendor.revenue.must_be_kind_of(Fixnum || Float)
    end

    # it "should return a number equal to the sum of a vendor's sales" do
    #   a_vendors_sales_list = @bread_vendor.sales
    #   a_vendors_sales_list.each do |vendor_sale|
    #     amounts_array
    #
    # end
  end

  describe "self.by_market" do
    it "should return an array" do
      FarMar::Vendor.by_market(20).must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Vendor instances" do
      a_markets_vendors = FarMar::Vendor.by_market(25)
      a_markets_vendors.each do |vendor|
        vendor.must_be_instance_of(FarMar::Vendor)
      end
    end

    it "should return an array of vendors whose market ids match the market id passed in" do
      a_markets_vendors = FarMar::Vendor.by_market(35)
      a_markets_vendors.each do |vendor|
        vendor.market_id.must_equal(35)
      end
    end
  end










end
