require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    my_hash = {id: 120,
      name: "Guin's Peaches",
      employees: 4,
      market_id: 12
    }
    let (:my_vendor) {FarMar::Vendor.new(my_hash)}
    it "has a vendor ID" do

      my_vendor.id.must_equal(120)
    end

    it "is associated with a market" do
      my_vendor.market_id.must_equal 12
    end
  end

  describe "self.all" do
    it "must return an array" do
      FarMar::Vendor.all.must_be_instance_of(Array)

    end

    it "has a Vendor as its first element" do

      FarMar::Vendor.all[0].must_be_instance_of(FarMar::Vendor)
    end

    describe "self.find" do
      it "returns a Vendor instance" do


        FarMar::Vendor.find(123).must_be_instance_of(FarMar::Vendor)
      end
    end

  end

end
