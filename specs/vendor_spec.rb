require_relative 'spec_helper'

module FarMar
  describe Vendor do

    describe "#initialize" do
      let(:vendor) {Vendor.new({id: 1, name: "Sally", num_of_employees: 1, market_id: 55})}

      it "should create an instance of Vendor" do
        vendor.must_be_instance_of(Vendor)
      end
    end
    describe "all" do
      it "should return an Array" do
        Vendor.all.must_be_kind_of(Array)
      end
      it "represents all of the objects described in the CSV" do
        Vendor.all.count.must_equal(2690)
      end
    end

    describe "find(id)" do
      it "should return the id that the passed parameter matches" do
        Vendor.find(109).id.must_equal(109)
      end

      it "should return the name that the passed parameter matches" do
        Vendor.find(238).name.must_equal("West Inc")
      end
    end

    describe "by_market(market_id)" do
      it "should return all of the vendors with the given market_id" do
        Vendor.by_market(500).count.must_equal(10)

      end

    end
    describe "#products" do
      it "should return true if the amount of products for the instance of Vendor is the number of instances of Product with that vendor_id." do
      v= Vendor.find(2)
      # puts "#{v.products}"
      v.products.count.must_equal(2)
      end
    end
  end
end
