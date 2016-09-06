require_relative 'spec_helper'

module FarMar
  describe Product do

    describe "#initialize" do
      let(:new_product) { Product.new({}) }

      it "should create a new instace of Product" do
        new_product.must_be_instance_of(Product)
      end
    end

    describe ".all" do
      let(:all_products) { Product.all }

      it "should return an array" do
        all_products.must_be_kind_of(Array)
      end
    end

  end
end
