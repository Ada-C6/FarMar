require_relative 'spec_helper'

module FarMar
  describe Vendor do

    describe "#initialize" do
      let(:new_vendor) { Vendor.new({}) }

      it "should create a new instace of Vendor" do
        new_vendor.must_be_instance_of(Vendor)
      end
    end

    describe ".all" do
      let(:all_vendors) { Vendor.all }

      it "should return an array" do
        all_vendors.must_be_kind_of(Array)
      end
    end


  end
end
