require_relative 'spec_helper.rb'
require_relative '../far_mar.rb'

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
    #vendor_id 7 product_id 14
    found_vendor.id.must_equal '7'
  end



end














