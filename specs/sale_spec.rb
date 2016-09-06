require_relative 'spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      sale_hash = FarMar::Sale.new("sale_hash")
      sale_hash.must_be_instance_of(FarMar::Sale)
    end

  end
end
