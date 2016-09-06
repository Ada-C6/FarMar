require_relative 'spec_helper'
# require '../lib/farmar_market'

describe Market do

  describe "#initialize" do
    it "should create an instance of Market" do
      m = Market.new
      m.must_be_instance_of(Market)
    end

    # it "should know about associated data file" do
    #   m = FarMar::Market.new
    #   m.all.class.must_equal(Hash)
    # end
  end


end
