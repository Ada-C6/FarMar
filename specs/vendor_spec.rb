require_relative 'spec_helper'

module FarMar
  describe Vendor do

    describe "#initialize" do
      let(:vendor) {Vendor.new(:name) }

      it "should create an instance of Vendor with a name parameter" do
        vendor.must_be_instance_of(Vendor)
      end
    end
  end
end
