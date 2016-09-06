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

      it "should return an object: Sale at any index of the array" do
        all_sales[0].must_be_instance_of(Sale)
        all_sales[10].must_be_instance_of(Sale)
        all_sales[20].must_be_instance_of(Sale)
      end
    end

    describe ".find(id)" do
      it "should return an object: Sale with amount 51 at ID 20" do
        tp = Sale.find(20)

        tp.must_be_instance_of(Sale)
        tp.amount.must_equal(51)
      end
    end

  end
end
