require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    test_vendor = FarMar::Vendor.new(784, "honeybees", 4, 560)

    it "should create a new instance" do
      test_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Vendor.all.must_be_kind_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object where the value of the id field in the CSV matches thepassedparameter" do
      puts "#{FarMar::Vendor.find(2).market_id}"
      FarMar::Vendor.find(2).id.must_equal(2)
    end
  end

  # describe "#market" do  #
  #   it "should return the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor.market_id field" do
  #     vendor_2.market(2).market_id.must_equal(1)
  #   end
  # end

  describe "self.by_market(market_id)" do
    it "should return an array of vendors with the given market_id" do
      FarMar::Vendor.by_market(2).must_be_kind_of(Array)
    end

    it "should return True if returning the correct number of vendors for given market_id" do
      FarMar::Vendor.by_market(2).length.must_equal(3)
    end
  end
end
