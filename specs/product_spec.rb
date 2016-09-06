require_relative 'spec_helper'
# require_relative '../Product'


describe FarMar::Product do

  market_hash = {
    id: 123,
    name: "Market",
    vendor_id: 98102
  }

  p = FarMar::Product.new(market_hash)

  describe "initialize" do
    it "should be an instance of Product" do
      p.must_be_instance_of(FarMar::Product)
    end
  end
end

# Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product
