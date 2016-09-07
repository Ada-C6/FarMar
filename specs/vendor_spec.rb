require_relative 'spec_helper'
require_relative '../lib/vendor'

describe FarMar::Vendor do
  describe "#initialize" do

    it "can create a new instance of Vendor" do
      vendor_hash = FarMar::Vendor.new("vendor_hash")
      vendor_hash.must_be_instance_of(FarMar::Vendor)
    end

  end

  describe "self.all" do
    let(:vendors) { FarMar::Vendor.all }

    it "should return an Array" do
      vendors.must_be_kind_of(Array)
    end

  end

  describe "self.find(input)" do
    let(:vendors) { FarMar::Vendor.find(2) }

    it "should return an instance of FarMar::Vendor" do
      vendors.must_be_instance_of(FarMar::Vendor)
    end

    it "should return a product based on vendor_id input" do
      vendors.vendor_id.must_equal(2)
    end

  end

  describe "self.by_market(market_id)" do
    before(:each) do
      @vendors = FarMar::Vendor.by_market(12)
    end

    it "should return an array" do
      @vendors.must_be_kind_of(Array)
    end

    it "should return all vendors with a given market ID" do
      @vendors.each do |i|
        i.market_id.must_equal(12)
      end
    end
  end

  describe "#market" do
    it "should return an instance of Market" do
      market.must_be_instance_of(FarMar::Market)
    end

    it "should use the vendor's market_id to return that vendor's market" do

    end

  end


end
