require_relative 'spec_helper.rb'
require_relative '../far_mar.rb'

describe "Testing product" do 
  # tests for the self.all method
  it "creates a new instance of Vendor" do
    id = 6
    product_name = "Smooth Mushrooms"
    vendor_id = 4

    quotidian_product = FarMar::Product.new(id, product_name, vendor_id)
    quotidian_product.id.must_equal id
    quotidian_product.product_name.must_equal product_name
  end

  it "Tests that we can call self.all" do
    quotidian_product_array = FarMar::Product.all
    quotidian_product_array.must_be_kind_of Array
    quotidian_product_array[0].must_be_kind_of FarMar::Product
  end

  it "Test that the object number == the CSV array length" do
    quotidian_product_array = FarMar::Product.all
    csv_array_array = CSV.read('./support/products.csv')
    csv_array_array.length.must_equal quotidian_product_array.length
  end

end