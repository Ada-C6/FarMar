require_relative 'spec_helper'

describe FarMar::Sale do
    let(:sam){FarMar::Sale.new(19, 15, "2013-11-06 20:44:00", 19, 58)}
  describe "#initialize" do

    it "can create a new instance of Sale" do
      sam.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Sale.all.must_be_kind_of(Array)
    end
  end
  describe "self.find(id)" do
    it "should return the id that was passed through" do
      FarMar::Sale.find(1).id.must_equal(1)
    end
 end
 describe "#vendor" do
   it "will return an instance of Farm::Vendor" do
     sam.vendor.must_be_instance_of(FarMar::Vendor)
   end
 end
 describe "#product" do
   it "returns an instance of FarMar::Product" do
     sam.product.must_be_instance_of(FarMar::Product)
   end
 end
describe "self.between(begin_time, end_time)" do
  it "will return FarMar:Sale instances" do
    FarMar::Sale.between("2013-11-11 11:29:52 -0800", "2013-11-12 14:38:29 -0800").must_be_kind_of(Array)
  end
  it "will not include dates outside of the range" do
    FarMar::Sale.between("2013-11-11 11:29:52 -0800", "2013-11-12 14:38:29 -0800").wont_include("2013-11-13 01:48:15 -0800")
  end
end
end
