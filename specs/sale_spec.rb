require_relative 'spec_helper'

module FarMar
  describe Sale do

    describe "#initialize" do
      let(:new_sale) { Sale.new({}) }

      it "should create a new instace of Sale" do
        new_sale.must_be_instance_of(Sale)
      end
    end

    describe ".read" do
      let(:read_sales) { Sale.read }

      it "should return an array" do
        #puts FarMar::Sale.read.length
        read_sales.must_be_kind_of(Array)
      end

      it "should return an object: Sale at any index of the array" do
        read_sales[0].must_be_instance_of(Sale)
        read_sales[10].must_be_instance_of(Sale)
        read_sales[20].must_be_instance_of(Sale)
      end
    end

    describe ".all" do
      let(:all_sales) { Sale.all }

      it "should return an array" do
        #puts FarMar::Sale.all.length
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

      it "should raise argument error when given an invalid id" do
        proc { Sale.find(987654321) }.must_raise(ArgumentError)
      end
    end

    describe "#vendor" do
      let(:new_sale) { Sale.new({vendor_id: 5}) }

      it "should return an object:Vendor" do
        new_sale.vendor.must_be_instance_of(Vendor)
      end

      it "should return the correct vendor" do
        new_sale.vendor.name.must_equal("Reynolds, Schmitt and Klocko")
      end
    end

    describe "#product" do
      let(:new_sale) { Sale.new({product_id: 5}) }
      it "should return an object:Product" do
        new_sale.product.must_be_instance_of(Product)
      end

      it "should return the correct Product" do
        new_sale.product.name.must_equal("Green Apples")
      end
    end

    describe "self.between(beginning_time, end_time)" do
      let(:sales_between) { Sale.between(DateTime.parse("2013-11-10 05:19:05 -0800"), DateTime.parse("2013-11-13 01:48:15 -0800")) }

      it "should return an array" do
        sales_between.must_be_kind_of(Array)
      end

      it "should have an object:Sale at any index of the array" do
        #puts sales_between.length
        sales_between[0].must_be_instance_of(Sale)
        sales_between[10].must_be_instance_of(Sale)
        sales_between[50].must_be_instance_of(Sale)
        sales_between[100].must_be_instance_of(Sale)
      end

      it "the time of the sale at any index should be between the arguments(beg_time, end_time)" do
        (sales_between[0].purchase_time.between?(DateTime.parse("2013-11-10 05:19:05 -0800"), DateTime.parse("2013-11-13 01:48:15 -0800"))).must_equal(true)
        (sales_between[10].purchase_time.between?(DateTime.parse("2013-11-10 05:19:05 -0800"), DateTime.parse("2013-11-13 01:48:15 -0800"))).must_equal(true)
        (sales_between[50].purchase_time.between?(DateTime.parse("2013-11-10 05:19:05 -0800"), DateTime.parse("2013-11-13 01:48:15 -0800"))).must_equal(true)
        (sales_between[100].purchase_time.between?(DateTime.parse("2013-11-10 05:19:05 -0800"), DateTime.parse("2013-11-13 01:48:15 -0800"))).must_equal(true)
      end
    end

    describe "self.ids" do
      it "should return an array" do
        Sale.ids.must_be_kind_of(Array)
      end

      it "should have a fixnum at any index of the array" do
        Sale.ids[0].must_be_kind_of(Fixnum)
        Sale.ids[10].must_be_kind_of(Fixnum)
        Sale.ids[50].must_be_kind_of(Fixnum)
      end

      it "should have id numbers at the correct index of the array" do
        Sale.ids[0].must_equal(Sale.all[0].id)
        Sale.ids[10].must_equal(Sale.all[10].id)
        Sale.ids[50].must_equal(Sale.all[50].id)
      end
    end
  end
end
