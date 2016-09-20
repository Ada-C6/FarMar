require_relative 'spec_helper.rb'
require_relative '../far_mar.rb'

describe "Testing vendor" do
  # test for the self.all method
  it "creates a new instance of Vendor" do
    # dummy data
    id = 4
    vendor_name = "Nada && Sons"
    employee_count = 10
    market_id = 5
    # instantiates new vendor for testing
    new_vendor1 = FarMar::Vendor.new(id, vendor_name, employee_count, market_id)

    new_vendor1.id.must_equal id
    new_vendor1.vendor_name.must_equal vendor_name
    new_vendor1.employee_count.must_equal employee_count
    new_vendor1.market_id.must_equal market_id
    
  end

  it "Tests that we can call self.all " do
    new_vendor_array = FarMar::Vendor.all
    new_vendor_array.must_be_kind_of Array
    new_vendor_array[0].must_be_kind_of FarMar::Vendor

  end

  it "Tests that the object number == the CSV array length" do
    # # returns an array of an array of strings
    new_vendor_array = FarMar::Vendor.all
    csv_array_array = CSV.read('./support/vendors.csv')
    csv_array_array.length.must_equal new_vendor_array.length
  end

  # testing the self.find methods

  it "Tests that the id parameter returns a matching market id" do
    new_vendor = FarMar::Vendor.find('474')
    new_vendor.must_be_kind_of FarMar::Vendor
    new_vendor.id.must_equal '474'
  end

  it "Tests that the method returns nil if no match for market id found" do
    new_vendor = FarMar::Vendor.find('2691')
    new_vendor.must_equal nil
  end

  # testing the additional FarMar::Vendor methods
  it "Tests that the instance method named get_market returns the FarMar::Market instance associated with the vendor using FarMar::Vendor.market_id field" do
    new_vendor = FarMar::Vendor.find('474')
    found_market = new_vendor.get_market
    found_market.id.must_equal '89'
  end

  it "Tests that the instance method named get_products returns a list of FarMar::Product instances associated by vendor id" do
    new_vendor = FarMar::Vendor.find('474')
    found_products = new_vendor.get_products
    found_products.must_be_kind_of Array
    found_products.length.must_equal 5
    
    found_products.each do |product|
       product.vendor_id.must_equal "474"
    end
  end

  it "Tests that the instance method named get_sales returns a list of FarMar::Sale instances associated by vendor_id field" do
    new_vendor = FarMar::Vendor.find('474')
    found_sales = new_vendor.get_sales
    found_sales.length.must_equal 2

    found_sales.each do |sale|
      sale.vendor_id.must_equal '474'
    end
  end

  it "Tests that the instance method get_revenue returns the sum of sales for the instance of vendor in cents." do
    new_vendor = FarMar::Vendor.find('474')
    revenue_earned = new_vendor.get_revenue
    revenue_earned.must_equal 11176
  end

  it  "Tests that self.by_market returns all vendors associated with a market_id" do
    found_vendors = FarMar::Vendor.by_market('2')
    found_vendors.length.must_equal 3

  end
end












