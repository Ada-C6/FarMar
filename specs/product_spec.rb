require_relative 'spec_helper'

describe FarMar::Product do
  describe "#initialize" do

    it "can create a new instance of Product" do
      FarMar::Product.new.must_be_instance_of(FarMar::Product)
    end
  end

end
