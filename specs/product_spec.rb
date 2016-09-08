require_relative 'spec_helper'
# require_relative '../Product'


describe FarMar::Product do

  p = FarMar::Product.new(123, "name", 9812)

  describe "initialize" do
    it "should be an instance of Product" do
      p.must_be_instance_of(FarMar::Product)
    end
  end
  describe "find " do
    product_find = FarMar::Product.find(1)
    it "returns an instance of the object where the value of the id matches" do
      product_find.must_be_kind_of(FarMar::Product)
    end
    it "should inlcude the values 'Dry Beets' " do
      product_find.name.must_equal "Dry Beets"
    end
  end
end
  # Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:
  #
  # ID - (Fixnum) uniquely identifies the product
  # Name - (String) the name of the product (not guaranteed unique)
  # Vendor_id - (Fixnum) a reference to which vendor sells this product
