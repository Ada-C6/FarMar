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

    end
  end

end
