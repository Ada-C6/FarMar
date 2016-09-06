require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do
    it "can create a new instance of Sale" do
      sam = FarMar::Sale.new(19, 15, 1998, 40, 10)
      sam.must_be_instance_of(FarMar::Sale)
    end
  end
end
