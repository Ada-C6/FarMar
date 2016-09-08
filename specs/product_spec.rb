require_relative 'spec_helper'

describe FarMar::Product do
let(:sam) {FarMar::Product.new(58, "Jane", 1)}
describe "#initialize" do
  it "can create a new instance of Product" do
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
describe "#vendor" do
  it "returns an instance of FarMar ::Vendor" do
    sam.vendor.must_be_instance_of(FarMar::Vendor)
  end
end
describe "self.by_vendor(vendor_id)" do
  it "returns the vendors of a given vendor id" do

    FarMar::Product.by_vendor(1).each do |x|
      x.vend_id.must_equal(1)
    end
  end
end
describe "#sales" do
  it "will return a collection of sales instances based on the product id" do
    sam.sales.must_be_kind_of(Object)
  end
end
describe "#number_of_sales" do
  it "can return the number of times a product has been sold" do
    sam.number_of_sales.must_equal(5)
  end
end
end
