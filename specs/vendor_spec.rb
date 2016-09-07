require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do

    it "can create a new instance of Vendor" do
      FarMar::Vendor.new(1584, "Quitzon-Jacobi", 3, 296).must_be_instance_of(FarMar::Vendor)
    end
    
  end
end
