require_relative 'spec_helper'
# require_relative '../vendor'

describe FarMar::Vendor do

  # vendor_info = {
  #   id: 123,
  #   name: "bibi",
  #   no_of_employee: 88,
  #   market_id: 888
  # }

  p = FarMar::Vendor.new(1, "bibi", 88, 888)

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

    # it "should return market name that is associated with " do
    #   p.market_info.each do |line|
    #     p.market.line.name.must_equal("People's Co-op Farmers Market")
    #   end
    # end
  end

  describe "sales" do
    it "should return sales amount given a vndor id" do
      p.sale_info.each do |line|
        p.sales.line.amount.must_equal(9290)
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
  # describe

  # let (:rererer) {Vendor.new(ereererr)}
  # :ererer some vendor

end
