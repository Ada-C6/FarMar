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

end