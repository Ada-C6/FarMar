require_relative 'spec_helper'


describe FarMar::Sale do
  describe "#initialize" do

    it "should be able to create a new instance of" do
      sale = FarMar::Sale.new
      sale.must_be_instance_of(FarMar::Sale)
    end


  end
end
