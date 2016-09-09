# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product
require_relative 'spec_helper'
module FarMar

  describe Product do

    describe "#initialize" do
      let(:product) { Product.new(:id, :name, :vendor_id) }


      it "can create an instance of Product" do
        product.must_be_instance_of(Product)
      end
      it "must respond to (have parameters of) of Product information" do
        product.must_respond_to(:id)
        product.must_respond_to(:name)
        product.must_respond_to(:vendor_id)
      end
    end

    describe "#self.all" do

      it "should return a hash" do
        Product.all.must_be_instance_of(Hash)
      end
      it "should return information about markets" do
        # first listed product
        Product.all[1].id.must_equal(1)
        Product.all[1].name.must_equal("Dry Beets")
        Product.all[1].vendor_id.must_equal(1)
        # last listed product
        Product.all[8193].id.must_equal(8193)
        Product.all[8193].name.must_equal("Cruel Beef")
        Product.all[8193].vendor_id.must_equal(2690)
      end
    end #self.all
    describe "#self.find(id)" do
      it "should return an instance of a Product object of a certain id" do
        random_product_id = rand(1..8193)
        Product.find(random_product_id).must_be_instance_of(Product)
        Product.find(random_product_id).id.must_equal(random_product_id)
      end
    end #self.find(id)

    #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
    describe "#vendor" do
      let(:product_instance) { Product.new(298,"Curly Fruit",96) }
      it "should return an instance of Vendor" do
        product_instance.vendor.must_be_instance_of(Vendor)
      end

      it "should be associated with the vendor_id in its instance of Product" do
        product_instance.vendor.id.must_equal(product_instance.vendor_id)
      end
    end
    #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
    describe "#sales" do
      let(:product_instance) { Product.new(298,"Curly Fruit",96) }
      it "should return a hash" do
        product_instance.sales.must_be_instance_of(Hash)
      end

      it "should return a collection of Sale instances associated by product_id" do
        product_instance.sales.each do |sale_id, sale|
          sale.must_be_instance_of(Sale)
          product_instance.id.must_equal(sale.product_id)
        end
      end
    end

    #number_of_sales: returns the number of times this product has been sold.
    describe "#number_of_sales" do
      before(:each) do
        @product_instance = Product.new(298,"Curly Fruit",96)
      end

      it "should return the number of times a product was sold" do
        @product_instance.number_of_sales.must_equal(7)
      end
    end

    describe "#self.by_vendor()" do
      it "should return a collection of instances of Product" do
        random_vendor_id = rand(1..2690)
        Product.by_vendor(random_vendor_id).each do |pro_id, pro|
          pro.must_be_instance_of(Product)
        end
      end
    end



  end
end
