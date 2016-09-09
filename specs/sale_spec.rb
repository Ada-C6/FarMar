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
      it "represents all of the objects described in the CSV" do
        Sale.all.count.must_equal(12798)
      end
    end

    describe "find(id)" do
      it "should return the id that the passed parameter matches" do
        Sale.find(55).id.must_equal(55)
      end

      it "should return true if the amount in cents matches the passed parameter" do
        Sale.find(277).amount_in_cents.must_equal(925)
      end
    end

    describe "#vendor" do
      it "should return true if it's an instance of Vendor" do
        s = Sale.find(2)
        s.vendor.must_be_instance_of(Vendor)
      end
    end

    describe "#product" do
      it "should return true if it's an instance of Product" do
        s = Sale.find(4)
        s.product.must_be_instance_of(Product)
      end
    end
    
  end
end
