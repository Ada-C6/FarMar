require_relative 'spec_helper'

describe FarMar::Vendor do
  let(:sam){FarMar::Vendor.new(19, "Betty", 8, 1)}
  describe "#initialize" do
    it "can create a new instance of Vendor" do
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
  describe "#market" do
    it "will return instances of FarMar::Market" do
      sam.market.must_be_instance_of(FarMar::Market)
    end
    it "will return an array of the market" do
      puts "#{sam.market}"
      sam.market.must_be_kind_of(Object)
    end
    it "will return the market that matches the market ID" do
      sam.market.id.must_equal(1)
    end
  end
  describe "#products" do
    it "can return products associated by the vendor ID " do
      puts "#{sam.products}"
      sam.products.each do |x|
        x.vend_id.must_equal(19)
      end
    end
    describe "#sales" do
      it "returns an array of values" do
        puts "#{sam.sales}"
        sam.sales.must_be_kind_of(Array)
      end
    end
  end
end
