require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      FarMar::Sale.new(11976, 6028, "2013-11-12 16:03:57 -0800", 2684, 8170).must_be_instance_of(FarMar::Sale)
    end
  end

  describe "all" do
    it "returns all instances of Sale" do
      FarMar::Sale.all.length.must_equal(12798)
    end
  end

  describe "find" do
    it "returns the instance of Sale whose sale id matches the argument sale id" do
      this_sale = FarMar::Sale.find(35)
      this_sale.amount.must_equal(8375)
    end
  end
end
