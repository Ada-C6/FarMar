require_relative 'spec_helper'

module FarMar
  describe Sale do

    describe "#initialize" do
      let(:new_sale) { Sale.new({}) }

      it "should create a new instace of Sale" do
        new_sale.must_be_instance_of(Sale)
      end
    end

    describe ".all" do
      let(:all_sales) { Sale.all }

      it "should return an array" do
        all_sales.must_be_kind_of(Array)
      end
    end

  end
end
