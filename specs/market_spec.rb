require_relative 'spec_helper'

module FarMar
  describe Market do

    describe "#initialize" do
      let(:new_market) { Market.new({}) }

      it "should create a new instace of Market" do
        new_market.must_be_instance_of(Market)
      end
    end

    describe ".read" do
      it "should return an array" do
        Market.read.must_be_kind_of(Array)
      end

      it "should return an object: Market at any index of the array" do
        Market.read[0].must_be_instance_of(Market)
        Market.read[10].must_be_instance_of(Market)
        Market.read[20].must_be_instance_of(Market)
      end
    end

    describe "self.all" do
      it "should return an array" do
        Market.all.must_be_kind_of(Array)
      end

      it "should return an object: Market at any index of the array" do
        Market.all[0].must_be_instance_of(Market)
        Market.all[10].must_be_instance_of(Market)
        Market.all[20].must_be_instance_of(Market)
      end
    end

    describe ".find(id)" do
      it "should return an object: Market with name Scottdale Farmers Market at ID 20" do
        scots = Market.find(20)

        scots.must_be_instance_of(Market)
        scots.name.must_equal("Scottdale Farmers Market")
      end

      it "should raise argument error when given an invalid id" do
        proc { Market.find(987654321) }.must_raise(ArgumentError)
      end
    end

    describe "#vendors" do
      before(:each) do #unnecessary because the tests dont change the values of this variable, but I wanted to try it out
        @example_market =  Market.new({id: 4, name: "Allison's Market", address: "address", city: "city", county: "county", state: "state", zip: "zip"})
        @four = @example_market.vendors
        @another_market = Market.new({id: 987654321987654321, name: "Dustin's Market"})
      end

      it "returns an array" do
        @example_market.vendors.must_be_kind_of(Array)
      end

      it "should return an object: Vendor at any index of the array" do
        @four[0].must_be_instance_of(Vendor)
        @four[1].must_be_instance_of(Vendor)
        @four[2].must_be_instance_of(Vendor)
      end

      it "should return the correct market_id that matches the one searched" do
        @four[0].market_id.must_equal(4)
        @four[1].market_id.must_equal(4)
        @four[2].market_id.must_equal(4)
      end
    end

    describe "self.ids" do
      it "should return an array" do
        Market.ids.must_be_kind_of(Array)
      end

      it "should have a fixnum at any index of the array" do
        Market.ids[0].must_be_kind_of(Fixnum)
        Market.ids[10].must_be_kind_of(Fixnum)
        Market.ids[50].must_be_kind_of(Fixnum)
      end

      it "should have id numbers at the correct index of the array" do
        Market.ids[0].must_equal(Market.all[0].id)
        Market.ids[10].must_equal(Market.all[10].id)
        Market.ids[50].must_equal(Market.all[50].id)
      end
    end

    describe "#products" do
      before(:each) do #unnecessary because the tests dont change the values of this variable, but I wanted to try it out
        @example_market =  Market.new({id: 4, name: "Allison's Market", address: "address", city: "city", county: "county", state: "state", zip: "zip"})
      end

      it "should return an array" do
        @example_market.products.must_be_kind_of(Array)
      end

      it "should have an object:Product at any index of the array" do
        @example_market.products[0].must_be_instance_of(Product)
        @example_market.products[2].must_be_instance_of(Product)
      end

      it "all products should have the correct market id" do
        @example_market.products[0].vendor_id.between?(13, 16).must_equal(true)
        @example_market.products[3].vendor_id.between?(13, 16).must_equal(true)
      end
    end
  end
end
