require_relative 'spec_helper'

module FarMar
  describe Sale do

    describe "#initialize" do
      let(:sale) {Sale.new(:name) }

      it "should create an instance of Sale" do
        sale.must_be_instance_of(Sale)
      end
    end
    describe "all" do
      it "should return an Array" do
        Sale.all.must_be_kind_of(Array)
      end
    end
  end
end
