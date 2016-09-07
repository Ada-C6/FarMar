require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do
    it "can create a new instance of Sale" do
      sam = FarMar::Sale.new(19, 15, 1998, 40, 10)
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
end
