require_relative 'spec_helper'
# require_relative '../sale'

describe FarMar::Sale do

  p = FarMar::Sale.new(123, 88, "12:50", 123, 123)

  describe "#initialize" do
    it"should be an instance of Sale" do
      p.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    it "should return '9290' for the amount if give id 1" do
      q =  FarMar::Sale.all
      s = q[1]
      s.amount.must_equal(9290)
    end
  end

  describe "self.find" do
    sale_find = FarMar::Sale.find(1)
    it "should be a kind of FarMar::Sale" do
      sale_find.must_be_kind_of(FarMar::Sale)
    end
    it "should have product id equal to '1' " do
      sale_find.product_id.must_equal 1
    end
  end

  describe "vendor" do
    it "should return vendor instances associated with the sale" do
      p.vendor_info.each do |line|
        p.vendor.line.amount.must_equal(sales.amount)
      end
    end
    it "should be a kind of an Array" do
      p.vendor.must_be_instance_of(Array)
    end
  end

  describe "product" do
    it "should return product instances associated with the sale" do
      p.product_info.each do |line|
        p.product.line.amount.must_equal(sales.amount)
      end
    end
  end

  describe "self.between"  do
    it "should returns Sale purched btween two times given" do
      q= FarMar::Sale.between(DateTime.parse("9290,2013-11-07 04:34:56"), DateTime.parse("9290,2013-12-07 06:34:56"))
      q.length.must_equal(1)
    end
  end
end
