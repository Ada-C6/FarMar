require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do
    test_sale = FarMar::Sale.new(1)

    it "should create a new instance" do
      test_sale.must_be_instance_of(FarMar::Sale)
    end
  end
end
