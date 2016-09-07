require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    it "can create a new instance of Vendor" do
      sam = FarMar::Vendor.new(19, "Betty", 8, 20)
      sam.must_be_instance_of(FarMar::Vendor)
    end
  end
  describe "self.all" do
    it "should return an array" do
      FarMar::Vendor.all.must_be_kind_of(Array)

    end
  end
  describe "self.find" do
    it "should return the id that was passed through" do

      FarMar::Vendor.find(1).vend_id.must_equal(1)
    end
  end
  describe "self.by_market" do
    it "should return vendors with a given market id" do
    
      FarMar::Vendor.by_market(1).must_be_kind_of(Array)
    end
  end
end
