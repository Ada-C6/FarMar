require_relative 'spec_helper'

describe FarMar::Vendor do

  let(:vendor) { FarMar::Vendor.new }

  describe "#initialize" do

    it "can create a new instance of Vendor" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should know about its related CSV file" do
      vendor.vendor_csv.wont_be_empty
    end
  end
end
