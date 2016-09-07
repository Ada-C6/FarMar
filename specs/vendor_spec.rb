require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do

    let (:my_vendor) {FarMar::Vendor.new({})}
    it "must respond to vendor id attribute" do

      my_vendor.must_respond_to(:id)
    end

    it "must respond to market id attribute" do
      my_vendor.must_respond_to(:market_id)
    end
  end

  describe "self.all" do
    it "must return an array" do
      FarMar::Vendor.all.must_be_instance_of(Array)

    end

    it "has a Vendor as its first element" do

      FarMar::Vendor.all[0].must_be_instance_of(FarMar::Vendor)
    end

    describe "self.find" do
      it "returns a Vendor instance" do


        FarMar::Vendor.find(123).must_be_instance_of(FarMar::Vendor)
      end
    end

    describe "#market" do
      it "must return a Market object"do
        another_vendor = FarMar::Vendor.new({market_id:10})
        another_vendor.market.must_be_instance_of FarMar::Market
      end

    end

    describe "self.by_market" do
      it "returns an array of Vendors" do
        FarMar::Vendor.by_market(37).must_be_instance_of Array
        FarMar::Vendor.by_market(37)[0].must_be_instance_of FarMar::Vendor
        FarMar::Vendor.by_market(34)[0].name.must_equal "Weissnat LLC"


      end
    end

  end

end
