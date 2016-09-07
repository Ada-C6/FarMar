require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      FarMar::Sale.new(11976, 6028, "2013-11-12 16:03:57 -0800", 2684, 8170).must_be_instance_of(FarMar::Sale)
    end
  end
end
