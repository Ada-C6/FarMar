require_relative 'spec_helper'

module FarMar
  describe Product do

    describe "#initialize" do
      let(:product) {Product.new(:name) }

      it "should create an instance of Product" do
        product.must_be_instance_of(Product)
      end
    end

    describe "all" do
      it "should return an Array" do
        Product.all.must_be_kind_of(Array)
      end
    end 
  end
end
