require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do
    product = FarMar::Product.new
    it "should create an instance of FarMar::Product class" do
      product.must_be_instance_of(FarMar::Product)
    end
  end
end
