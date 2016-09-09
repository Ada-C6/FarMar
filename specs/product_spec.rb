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

    describe "#vendor" do
      it "should return an instance of Vendor" do
        p = Product.find(2)
        p.vendor.must_be_instance_of(Vendor)
      end
    end

    describe "#sales" do
      it "returns true if the returned instances of Sale are of the same product id" do
        p = Product.find(2)
        p.sales.count.must_equal(1)
      end
    end

    describe "#number_of_sales" do
      it "returns the number of times this product has been sold" do
        p = Product.find(1)
        p.number_of_sales.must_equal(7)
      end
    end
  end
end
