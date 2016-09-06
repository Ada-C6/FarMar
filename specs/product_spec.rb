require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do
    test_product = FarMar::Product.new(345)

    it "should create a new instance" do
      test_product.must_be_instance_of(FarMar::Product)
    end
  end
end
