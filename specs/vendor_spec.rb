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
      another_vendor.market.name.must_equal "Saratoga Farmers' Market"
    end

  end

  describe "self.by_market" do

    it "returns an array of Vendors" do
      FarMar::Vendor.by_market(37).must_be_instance_of Array
      FarMar::Vendor.by_market(37)[0].must_be_instance_of FarMar::Vendor
      FarMar::Vendor.by_market(34)[0].name.must_equal "Weissnat LLC"
    end

  end

  describe "#products" do

    new_vendor = FarMar::Vendor.new({id:10})
    it "must return an array of Products" do
      new_vendor.products.must_be_instance_of Array
      if new_vendor.products.length > 0
        new_vendor.products[0].must_be_instance_of FarMar::Product
      end
    end

  end

  describe "#sales" do

    new_vendor = FarMar::Vendor.new({id:45})
    it "must return an array of Sales" do
      new_vendor.sales.must_be_instance_of Array
      if new_vendor.sales.length > 0
        new_vendor.sales[0].must_be_instance_of FarMar::Sale
      end
    end

  end

  describe "#revenue" do

    vendor = FarMar::Vendor.new({id:4})
    it "returns the amount of revenue from allsales in pennies, a Fixnum" do
      vendor.revenue.must_be_instance_of Fixnum
      vendor.revenue.must_equal 26866
    end

  end
end
