require_relative 'spec_helper'
require_relative '../lib/farmar_sale'

describe FarMar::Sale do
  describe "#initialize" do
    sale = FarMar::Sale.new
    it "should create an instance of FarMar::Sale class" do
      sale.must_be_instance_of(FarMar::Sale)
    end
  end
end
