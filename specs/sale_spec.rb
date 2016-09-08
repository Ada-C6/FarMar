require_relative 'spec_helper'

module FarMar
  describe Sale do
    let(:buy_a_thing) {Sale.new(1,100,"2013-11-07", 1, 1)}
    describe "#initialize" do
      it "should make a new instance of sale" do
        buy_a_thing.must_be_instance_of(Sale)
        # ID - (Fixnum) uniquely identifies the sale
        # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
        # Purchase_time - (Datetime) when the sale was completed
        # Vendor_id - (Fixnum) a reference to which vendor completed the sale
        # Product_id - (Fixnum) a reference to which product was sold
      end

      it "should have a sale amount" do
        buy_a_thing.must_respond_to :amount
      end

      it "should have a purchase_time" do
        buy_a_thing.purchase_time.must_be_instance_of(DateTime)
      end
    end

    describe "self.all" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      it "should return a collection of Sale objects" do
        # I'm going to start with hash with sale ID as the key. I think I'm going to need to get back out the vendor and product associated with it, but this seems good for now.
        Sale.all.must_be_instance_of(Hash)
      end

    end

    describe "self.find(id)" do
      before(:all) do
        @sale_21 = Sale.find(21)
      end
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      it "should return a sale, given an id" do
        @sale_21.must_be_instance_of(Sale)
      end

      it "should return the correct vendor id given the sale id" do
        @sale_21.vendor_id.must_equal(4)
        # 21,8963,2013-11-10 12:26:30 -0800,4,7
      end
      it "should return the correct product id, given the sale id" do
        @sale_21.product_id.must_equal(7)
      end
    end

    describe "#vendor" do
      let (:new_sale) {Sale.new(13,3450,"2013-11-12 12:00:35 -0800",3,4)}
      #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
      it "should return a vendor instance" do
        # will this use the Vendor.find(id) method?
        new_sale.vendor.must_be_instance_of(Vendor)
      end
      it "should be the correct vendor" do
        # Same problem as other tests - it's a different instance of the object - same values, different object ID.
        new_sale.vendor.name.must_equal("Breitenberg Inc")
      end
    end
  end
end

#product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
# self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
