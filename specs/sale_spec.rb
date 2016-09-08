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
  end #end sale
end #end module
