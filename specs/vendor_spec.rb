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
    # it "should return an array" do
    #
    # end
    #
    # it "should return an array made up of FarMar::Product instances" do
    #
    # end
    #
    # it "should have only FarMar::Product instances whose vendor id matches the vendor the method is called on" do
    #
    # end
  end

end
