require_relative 'spec_helper'

module FarMar
  describe Product do

    describe "#initialize" do
      let(:product) {Product.new({id: 8194, name: "Skittles", vendor_id: 500}) }

      it "should create an instance of Product" do
        product.must_be_instance_of(Product)
      end
    end

    describe "all" do
      it "should return an Array" do
        Product.all.must_be_kind_of(Array)
      end

      it "represents all of the objects described in the CSV" do
        Product.all.count.must_equal(8193)
      end
    end

    describe "find(id)" do
      it "should return the id that the passed argument matches" do
        Product.find(122).id.must_equal(122)
      end

      it "should return the name that the passed argument matches" do
        Product.find(200).name.must_equal("Odd Pretzel")
      end
    end

    describe "by_vendor(vendor_id)" do
      it "should return all of the products with the given vendor_id" do
        Product.by_vendor(245).count.must_equal(4)

      end

    end
  end
end
