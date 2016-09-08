require_relative 'spec_helper'

describe FarMar::Product do
let(:sam) {FarMar::Product.new(19, "Jane", 1)}
describe "#initialize" do
  it "can create a new instance of Product" do
    sam = FarMar::Product.new(19, "Jane", 81)
    sam.must_be_instance_of(FarMar::Product)
  end
end
describe "self.all" do
  it "should return an array" do
    FarMar::Product.all.must_be_kind_of(Array)
  end
end
describe "self.find(id)" do
  it "should return the id that was passed through" do
    FarMar::Product.find(1).id.must_equal(1)
  end
end
describe "self.by_vendor(vendor_id)" do
  it "returns the vendors of a given vendor id" do
  
    FarMar::Product.by_vendor(1).each do |x|
      x.vend_id.must_equal(1)
    end
  end
end
end
