require_relative 'spec_helper.rb'
require_relative '../far_mar.rb'
require 'date'

describe "Testing sale" do 

  it "creates a new instance of Sale" do
    id = 5
    sale_amount = 4440
    purchase_date = "2013-11-10 05:19:05 -0800"
    vendor_id = 1
    product_id = 1

    # instantiates new sale for testing
    quotidian_sale = FarMar::Sale.new(id, sale_amount, purchase_date, vendor_id, product_id)
    quotidian_sale.id.must_equal id
    quotidian_sale.sale_amount.must_equal sale_amount
    quotidian_sale.purchase_date.must_equal purchase_date
    quotidian_sale.vendor_id.must_equal vendor_id
    quotidian_sale.product_id.must_equal product_id

  end

  it "Tests that we can call self.all" do
    quotidian_sale = FarMar::Sale.all
    quotidian_sale.must_be_kind_of Array
    quotidian_sale[0].must_be_kind_of FarMar::Sale
  end

  it "Tests that the object number == the CSV array length" do
    quotidian_sale_array = FarMar::Sale.all
    csv_sale_array = CSV.read('./support/sales.csv')
    csv_sale_array.length.must_equal quotidian_sale_array.length
  end

   # testing the self.find methods

   it "Tests that the id parameter returns a matching sale id" do
    quotidian_sale = FarMar::Sale.find('32')
    quotidian_sale.must_be_kind_of FarMar::Sale
    quotidian_sale.id.must_equal '32'
   end

  it "Tests that the method returns nil if no match for the sale id is found" do
    quotidian_sale = FarMar::Sale.find('13000')
    quotidian_sale.must_equal nil
  end

  it "Tests that the get_vendor method returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
    new_sale = FarMar::Sale.find('32')
    found_vendor = new_sale.get_vendor
    #vendor_id 7 
    found_vendor.id.must_equal '7'
  end

  it "Tests that get_product returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field" do
    new_sale = FarMar::Sale.find('32')
    found_product = new_sale.get_product
    #product_id 14
    found_product.id.must_equal '14'
  end

  # "2013-11-13 04:14:40 -0800"
  it "self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do

    # tests for a single instance
    start_time = "2013-11-13 04:14:40 -0800"
    end_time = "2013-11-13 04:14:40 -0800"

    found_sales = FarMar::Sale.between(start_time, end_time)
    found_sales.length.must_equal 1

    # tests for many instances
    start_time = "2013-11-13 00:00:00 -0800"
    end_time = "2013-11-13 23:59:59 -0800"

    found_sales = FarMar::Sale.between(start_time, end_time)
    found_sales.length.must_equal 669

    # tests for instances where no sales are made
    start_time = "2013-11-13 23:59:59 -0800"
    end_time = "2013-11-13 00:00:00 -0800"

    found_sales = FarMar::Sale.between(start_time, end_time)
    found_sales.length.must_equal 0

    
    # dr. who test because wiggly wobbly timey wimey
    start_time = "1900-01-01 00:00:01 -0800"
    end_time = "3000-12-31 23:59:59 -0800"

    found_sales = FarMar::Sale.between(start_time, end_time)
    found_sales.length.must_equal 12798
  end


end














