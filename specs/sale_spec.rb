require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      FarMar::Sale.new.must_be_instance_of(FarMar::Sale)
    end
  end
end
