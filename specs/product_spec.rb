require_relative 'spec_helper'

module FarMar
  describe Product do

    describe "#initialize" do
      let(:product) {Product.new(:name) }

      it "should create an instance of Product with a name parameter" do
        product.must_be_instance_of(Product)
      end
    end
  end
end
