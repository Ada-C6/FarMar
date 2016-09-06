require_relative 'spec_helper'

module FarMar
  describe Sale do

    describe "#initialize" do
      let(:sale) {Sale.new({id: 1, amount_in_cents: 100, purchase_time: "2013-11-10 18:56:53 -0800", vendor_id: 1, product_id: 1})}

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
