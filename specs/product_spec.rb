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
     end

   end #end initialize method

 end #end Product
end #end module
