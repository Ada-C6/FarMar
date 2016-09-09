require_relative 'spec_helper'
module FarMar
  describe "Sale" do
    describe "#initialize" do
      before(:all) do
        @sale = Sale.new(9, 9128, 2013-11-13,3,4)
      end

      it "should create an instance of a sale" do
        @sale.must_be_instance_of(Sale)
      end

      it "should have a vendor id" do
        @sale.vendor_id.must_equal(3)
      end
    end

    describe "self.all" do
      let(:sales) { Sale.all }

      it "should create an array of instances of sales from the CSV file" do
        Sale.all.must_be_kind_of(Hash)
      end
    end #end self.all

    describe "self.find(id)" do
      let(:sales) { Sale.find(20) }

      it "should return instance of a sale by its sale id" do
        sold_foots = Sale.find(20)
        sold_foots.id.must_equal(20)
      end
    end

    describe "#vendor" do
      let (:sale) {Sale.find(8)} #vendor id is 2
      it "should return the instance of Vendor for the particular sale" do
        sale.vendor.must_be_instance_of(Vendor)
      end

      it "should return the right vendor id" do
        sale.vendor_id.must_equal(2)
      end
    end

    describe "#product" do
      let (:sale) {Sale.find(21)} #should return product with id of 7
      it "should return the product instance asssociated with the particular sale" do
        sale.product.must_be_instance_of(Product)
      end
      it "should return the right product id" do
        sale.product_id.must_equal(7)
      end
    end

    describe "self.between(beginning_time, end_time)" do
      it "should return an array of products within the specified time range" do
        beginning_time = DateTime.parse("2013-11-11 11:29:52 -0800")
        end_time = DateTime.parse("2013-11-13 01:48:15 -0800")
        Sale.between(beginning_time, end_time).must_be_kind_of(Array)
      end
    end
  end #end sale
end #end module
