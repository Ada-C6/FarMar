require_relative 'spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do
  describe "#initialize" do

    it "can create a new instance of Sale" do
      sale_hash = FarMar::Sale.new("sale_hash")
      sale_hash.must_be_instance_of(FarMar::Sale)
    end

  end

  describe "self.all" do
    let(:sales) { FarMar::Sale.all }

    it "should return an Array" do
      sales.must_be_kind_of(Array)
    end

  end

  describe "self.find(id)" do
    let(:sales) { FarMar::Sale.all }

    it "should return a Array" do
      sales.must_be_kind_of(Array)
    end
  end
end
