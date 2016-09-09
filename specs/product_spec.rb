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

      it "should raise argument error when given an invalid id" do
        proc { Product.find(987654321) }.must_raise(ArgumentError)
      end
    end

    describe "#vendor" do
      let(:new_product) { Product.new({id: 213, name: "greens", vendor_id: 4}) }

      it "should return a object:Vendor" do
        new_product.vendor.must_be_instance_of(Vendor)
      end

      it "should return the correct Vendor" do
        new_product.vendor.name.must_equal("Kris and Sons")
      end
    end

    describe "#sales" do
      let(:new_product) { Product.new({id: 21, name: "greens", vendor_id: 4}) }

      it "should return an array" do
        new_product.sales.must_be_kind_of(Array)
      end

      it "should have an object:Sale at any index of that array" do
        #puts new_product.sales
        new_product.sales[0].must_be_instance_of(Sale)
        new_product.sales[1].must_be_instance_of(Sale)
      end

      it "should have the correct sales in the array" do
        new_product.sales[0].amount.must_equal(2510)
        new_product.sales[1].amount.must_equal(9341)
      end
    end

    describe "#number_of_sales" do
      let(:new_product) { Product.new({id: 21, name: "greens", vendor_id: 4}) }

      it "should return a fixnum" do
        #puts new_product.number_of_sales
        new_product.number_of_sales.must_be_kind_of(Fixnum)
      end

      it "should return the correct number of sales" do
        new_product.number_of_sales.must_equal(2)
      end
    end

    describe "self.by_vendor(vendor_id)" do
      let(:example_vendor) { Vendor.new({id: 5, name: "Allison", num_employees: 75, market_id: 6}) }

      it "should return an array" do
        FarMar::Product.by_vendor(example_vendor.id).must_be_kind_of(Array)
      end

      it "should return an object: Product at any index of the array" do
        FarMar::Product.by_vendor(example_vendor.id)[0].must_be_instance_of(Product)
        FarMar::Product.by_vendor(example_vendor.id)[2].must_be_instance_of(Product)
      end

      it "each object returned should be associated with the correct vendor_id by checking the name" do #IS THIS A BETTER TEST?
        FarMar::Product.by_vendor(example_vendor.id)[0].name.must_equal("Shaky Honey")
        FarMar::Product.by_vendor(example_vendor.id)[2].name.must_equal("Black Apples")
      end

      it "should raise an argument error if invalid vendor id is supplied" do
        proc { FarMar::Product.by_vendor(98765432) }.must_raise(ArgumentError)
      end
    end
  end
end
