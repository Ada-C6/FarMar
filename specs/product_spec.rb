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

      it "should return an object: Product at any index of the array" do
        all_products[0].must_be_instance_of(Product)
        all_products[10].must_be_instance_of(Product)
        all_products[20].must_be_instance_of(Product)
      end
    end

    describe ".find(id)" do
      it "should return an object: Product with name Tall Pretzel at ID 20" do
        tp = Product.find(20)

        tp.must_be_instance_of(Product)
        tp.name.must_equal("Tall Pretzel")
      end
    end

  end
end
