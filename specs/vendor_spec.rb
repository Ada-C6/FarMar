require_relative 'spec_helper'

module FarMar
  describe Vendor do

    describe "#initialize" do
      let(:vendor) {Vendor.new(:name) }

      it "should create an instance of Vendor" do
        vendor.must_be_instance_of(Vendor)
      end
    end
    describe "all" do
      it "should return an Array" do
        Vendor.all.must_be_kind_of(Array)
      end
    end
  end
end
