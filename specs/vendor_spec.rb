require_relative 'spec_helper'

module FarMar
  describe Vendor do

    describe "#initialize" do
      let(:new_vendor) { Vendor.new({}) }

      it "should create a new instace of Vendor" do
        new_vendor.must_be_instance_of(Vendor)
      end
    end

    describe ".all" do
      let(:all_vendors) { Vendor.all }

      it "should return an array" do
        all_vendors.must_be_kind_of(Array)
      end

      it "should return an object: Vendor at any index of the array" do
        all_vendors[0].must_be_instance_of(Vendor)
        all_vendors[10].must_be_instance_of(Vendor)
        all_vendors[20].must_be_instance_of(Vendor)
      end
    end

    describe ".find(id)" do
      it "should return an object: Vendor with name Ledner Group at ID 20" do
        led = Vendor.find(20)

        led.must_be_instance_of(Vendor)
        led.name.must_equal("Ledner Group")
      end
    end

    describe "#market" do
      let(:example_vendor) { Vendor.new({id: 9876, name: "Allison", num_employees: 75, market_id: 6}) }

      it "should return an object: Market" do
        example_vendor.market.must_be_instance_of(Market)
      end

      it "should return the correct instance of Market" do
        jcfm = example_vendor.market
        jcfm.name.must_equal("Jefferson City Farmer's Market")
        jcfm.id.must_equal(6)
      end
    end

  end
end
