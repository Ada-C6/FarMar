require_relative 'spec_helper'

describe FarMar::Sale do
  sale = FarMar::Sale.new(0,200,"1200",1,1)

  describe "#initialize" do
    it "should create a new instance of Sale" do
      sale.must_be_instance_of FarMar::Sale
    end
  end

  describe "#self.all" do
    it "should return a hash" do
      FarMar::Sale.all.must_be_kind_of Hash
    end
  end
end
