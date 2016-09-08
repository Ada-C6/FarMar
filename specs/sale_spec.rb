require_relative 'spec_helper'
# require_relative '../sale'

describe FarMar::Sale do

  # sale_info = {
  #   id: 123,
  #   amount: 88,
  #   purchase_time: "12:50",
  #   vendor_id: 123,
  #   product_id: 123
  # }

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




end
