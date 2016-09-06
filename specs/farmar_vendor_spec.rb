require_relative 'spec_helper'
# require '../lib/farmar_vendor'

describe Vendor do

  describe "#initialize" do
    it "should create an instance of Vendor" do
      m = Vendor.new
      m.must_be_instance_of(Vendor)
    end
    #
    # it "should know about associated data file" do
    #   m = FarMar::Market.new
    #   m.all.class.must_equal(Hash)
    # end
  end


end
