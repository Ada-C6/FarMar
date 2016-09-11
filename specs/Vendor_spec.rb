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






  
end