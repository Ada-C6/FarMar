require_relative 'spec_helper'
# require_relative '../vendor'

describe FarMar::Vendor do

  # vendor_info = {
  #   id: 123,
  #   name: "bibi",
  #   no_of_employee: 88,
  #   market_id: 888
  # }

  p = FarMar::Vendor.new(1, "bibi", 28, 8)

  describe "#initialize" do
    it "should be an instance of Vendor" do
      p.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "slef.find" do
    it "should return the name of the vendor given a vendor id" do
      FarMar::Vendor.find(1).name.must_equal("Feil-Farrell")
    end
  end

  describe "market" do
    it "should be a kind of Array" do
      p.market.must_be_kind_of(Array)
    end
  end


  describe "sales" do
    it "should return sales amount given a vndor id" do
      p.sale_info.each do |line|
        p.sales.line.amount.must_equal(sales.amount)
      end
    end
  end

  describe "self.by_market" do
    it "should return the vendors given the vendor information" do
      FarMar::Vendor.by_market(1).each do |line|
        line.market_id.must_equal(1)
      end
    end
  end

  describe "products" do
       it "should return an array" do
       p.products.must_be_kind_of(Array)
     end
  end

  describe "self.by_vendor" do
    it "should return the products given the vendor information" do
      FarMar::Product.by_vendor(1).each do |line|
        line.vendor_id.must_equal(1)
      end
    end
  end



  # describe

  # let (:rererer) {Vendor.new(ereererr)}
  # :ererer some vendor

end
