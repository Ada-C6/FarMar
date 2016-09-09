require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      FarMar::Sale.new(11976, 6028, "2013-11-08T08:08:48-08:00", 2684, 8170).must_be_instance_of(FarMar::Sale)
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

  describe "between" do
    it "returns all instances of Sale within the DateTimes given in the argument" do
      FarMar::Sale.between("2013-11-10 04:30:00", "2013-11-10 05:00:00").length.must_equal(37)
    end
  end

  describe "#vendor" do
    it "returns the instance of Vendor associated with that instance of Sale" do
      s = FarMar::Sale.find(250)
      s.vendor.id.must_equal(52)
    end
  end

  describe "#product" do
    it "returns the instance of Product associated with that instance of Sale" do
      this_sale = FarMar::Sale.find(121)
      this_sale.product.id.must_equal(70)
    end
  end
end
