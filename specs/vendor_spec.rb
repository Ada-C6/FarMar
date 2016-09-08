require_relative 'spec_helper'
module FarMar
  describe Vendor do
    describe "#initialize" do
      my_hash = {
        id:  112,
        name: "Ada Farms",
        num_employees: 12,
        market_id: 1202
      }
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

  end #end vendor

end #end module
