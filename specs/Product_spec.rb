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
  # testing the self.find methods

  it "Tests that the id parameter returns a matching product id" do
    quotidian_product = FarMar::Product.find('30')
    quotidian_product.must_be_kind_of FarMar::Product
    quotidian_product.id.must_equal '30'
  end

  it "Tests that the  method returns nil if no match is found" do
    quotidian_product = FarMar::Product.find('8195')
    quotidian_product.must_equal nil
  end

  it "Tests that get_vendor returns an instance of FarMar::Vendor using the FarMar::Product vendor_id field" do
    new_product = FarMar::Product.find('30')
    found_vendor = new_product.get_vendor
    #vendor 11, depressed beets
    found_vendor.id.must_equal '11'
  end

  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.

  # 64,8362,2013-11-07 05:30:08 -0800,11,30
  it "Tests that it returns an array of FarMar::Sale instance that use the FarMar::Sale product_id field" do
    new_product = FarMar::Product.find('30')
    found_sales = new_product.get_sales
    found_sales.length.must_equal 1
    found_sales.first.product_id.must_equal '30'
  end

  it "Tests that sale_count returns the count of sales for the instance of a product" do
    new_product = FarMar::Product.find('30')
    sale_count_of_product = new_product.sale_count
    sale_count_of_product.must_equal 1


  end

end
















