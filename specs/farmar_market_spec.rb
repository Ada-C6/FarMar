require_relative 'spec_helper'

describe Market do
  let (:m) { Market.new(500, "name", "address", "city", "county", "state", "zip") }

  describe "#initialize" do
    it "should create an instance of Market" do
      m = Market.new(123, "name", "address", "city", "county", "state", "zip")
      m.must_be_instance_of(Market)
    end

    it "should know about associated data file" do
      m = Market.all
      m[500].city.must_equal("Bronx")
    end
  end

  describe "all" do
    it "should return a hash" do
      m = Market.all
      m.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      m = Market.find(500)
      m.must_be_instance_of(Market)
      m.id.must_equal(500)
    end
  end

  describe "#vendors" do
    it "should return a collection of FarMar::Vendor instances that are associated with the market" do
      # m = Market.new(500, "name", "address", "city", "county", "state", "zip")
      m.vendors.length.must_equal(10)
    end
  end

  describe "#products" do
    it "should return a collection of Product instances that are associated to the market through the Vendor class" do
      m.products.length.must_equal(34)
    end
  end

  describe "search" do
    it "should returna collection of Market instances where the market or vendor name contain the search item" do
      # Market.search('school').length.must_equal(3)
      Market.search('collins').length.must_equal(12 + 2) # 12 vendors and 2 markets
    end
  end

  describe "#prefered_vendor" do
    it "should return the vendor with the highest revenue" do
      m.prefered_vendor.class.must_equal(Vendor)
    end
  end

  # describe "#prefered_vendor(date)" do
  #   it "should return the vendor with the highest revenue for the given date" do
  #
  #   end
  # end

end
