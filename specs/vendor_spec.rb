require_relative 'spec_helper'
module FarMar
  describe Vendor do
    describe "initialize" do
      my_hash = {
        id:  112,
        name: "Ada Farms",
        num_employees: 12,
        market_id: 1234
      }
      let(:vendor) { Vendor.new(my_hash) }
      it "should create an instance of a vendor" do
        vendor.must_be_instance_of(Vendor)

      end

    end #end initialize

    describe "self.all" do

    end #end self.all

  end #end vendor

end #end module
