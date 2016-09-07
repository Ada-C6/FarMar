require_relative 'spec_helper'

describe FarMar::Vendor do

  let(:vendor) { FarMar::Vendor.new }

  describe "#initialize" do

    it "can create a new instance of Vendor" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end

  end
end
