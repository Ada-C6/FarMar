require_relative 'spec_helper'
module FarMar
 describe Product do
   describe "#initialize" do
     my_hash = {
       id:  23,
       name: "Ada Farms Milk",
       vendor_id: 112
     }

     let(:product) { Product.new(my_hash) }
     it "should create an instance of a product" do
       product.must_be_instance_of(Product)
     end #end initialize method
   end
   describe "self.all" do
       let(:products) { Product.all }

     it "should create an array of instances of markets through the CSV file" do
      Product.all.must_be_kind_of(Array)
     end

     #Should i write a test here to make sure it's returning the right information? exam make sure vendor_id returns number,not nil?
   end
 end #end Product
end #end module
