require_relative 'spec_helper'
module FarMar
  describe Vendor do
    describe "#initialize" do

      let(:vendor) { Vendor.new(112, "ada farms", 12, 1202) }
      it "should create an instance of a vendor" do
        vendor.must_be_instance_of(Vendor)
      end
    end #end initialize

    describe "self.all" do
        let(:vendors) { Vendor.all }
        it "should create an array of instances of markets through the CSV file" do

         Vendor.all.must_be_kind_of(Hash)
        end
    end #end self.all

    describe "self.find(id)" do
      let(:vendors) { Vendor.find(8) }
      it "should return instance of a vendor by its id" do
        foots = Vendor.find(8)
        foots.id.must_equal(8)
      end
    end #end self.find method

    describe "products"

    describe "#market" do
      let(:vendors) { Vendor.all }
      it "should return the market hash that the vendor is a part of, using the vendor's market id" do
        cat_vendor = FarMar::Vendor.find(2)
        cat_vendor.markets.market_id.must_equal(1)
        # Maybe try "Toy and Sons"
      end #this is not a good test
    end

  end #end vendor

end #end module
