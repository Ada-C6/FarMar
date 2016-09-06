require_relative 'spec_helper'
require_relative '../lib/product.rb'

describe FarMar::Product do
  describe "#initialize" do

    it "should be able to create a new instance of Product" do
      soap = FarMar::Product.new
      soap.must_be_instance_of(FarMar::Product)
    end

  end
end
