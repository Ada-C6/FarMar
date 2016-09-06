require_relative 'spec_helper'
# require '../lib/farmar_product'

describe Product do

  describe "#initialize" do
    it "should create an instance of Product" do
      p = Product.new
      p.must_be_instance_of (Product)
    end

    # it "should know about associated data file" do
    #   m = FarMar::Market.new
    #   m.all.class.must_equal(Hash)
    # end
  end


end
