require_relative 'spec_helper'
# require '../lib/farmar_sale'

describe Sale do

  describe "#initialize" do
    it "should create an instance of Sale" do
      m = Sale.new
      m.must_be_instance_of(Sale)
    end
    #
    # it "should know about associated data file" do
    #   m = FarMar::Market.new
    #   m.all.class.must_equal(Hash)
    # end
  end


end
