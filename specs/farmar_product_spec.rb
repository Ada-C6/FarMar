require_relative 'spec_helper'

describe FarMar::Product do

  let(:product) { FarMar::Product.new }

  describe "#initialize" do

    it "can create a new instance of Product" do
      product.must_be_instance_of(FarMar::Product)
    end

    it "should know about its related CSV file" do
      product.product_csv.wont_be_empty
    end
  end
end
