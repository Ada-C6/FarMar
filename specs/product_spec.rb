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




  end
end
