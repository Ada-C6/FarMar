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
      it "should return an array" do
        Vendor.all.must_be_kind_of(Array)
      end

      it "should return an object: Vendor at any index of the array" do
        Vendor.all[0].must_be_instance_of(Vendor)
        Vendor.all[10].must_be_instance_of(Vendor)
        Vendor.all[20].must_be_instance_of(Vendor)
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

    describe "#products" do
      before(:each) do
        @example_vendor = Vendor.new({id: 5, name: "Allison", num_employees: 75, market_id: 6})
      end

      it "should return an array" do
        @example_vendor.products.must_be_kind_of(Array)
      end

      it "should return an object: Product at any index of the array" do
        @example_vendor.products[0].must_be_instance_of(Product)
        @example_vendor.products[2].must_be_instance_of(Product)
      end

      it "each object should have the correct vendor id" do #IS THIS A BETTER TEST?
        @example_vendor.products[0].vendor_id.must_equal(@example_vendor.id)
        @example_vendor.products[2].vendor_id.must_equal(@example_vendor.id)
      end
    end

    describe "#sales" do
      let(:example_vendor) { Vendor.new({id: 5, name: "Allison", num_employees: 75, market_id: 6}) }

      it "should return an array" do
        example_vendor.sales.must_be_kind_of(Array)
      end

      it "should return an object:Sale at any index of the array" do
        #puts example_vendor.sales

        example_vendor.sales[0].must_be_instance_of(Sale)
        example_vendor.sales[8].must_be_instance_of(Sale)
      end

      it "each sale should have the correct vendor id" do
        example_vendor.sales[0].vendor_id.must_equal(example_vendor.id)
      end
    end

    describe "#revenue" do
      let(:example_vendor) { Vendor.new({id: 5, name: "Allison", num_employees: 75, market_id: 6}) }

      it "should return a fixnum" do
        example_vendor.revenue.must_be_kind_of(Fixnum)
      end

      it "should return the correct amount" do
        example_vendor.revenue.must_equal(61749)
      end
    end

    describe "self.by_market(market_id)" do
      let(:vendors_by_market) { Vendor.by_market(4) }

      it "should return an array" do
        vendors_by_market.must_be_kind_of(Array)
      end

      it "should have an object:Vendor at any index of the array" do
        vendors_by_market[0].must_be_instance_of(Vendor)
        vendors_by_market[3].must_be_instance_of(Vendor)
      end

      it "should return the correct vendors" do
        vendors_by_market[0].id.must_equal(13)
        vendors_by_market[2].id.must_equal(15)
        vendors_by_market[3].id.must_equal(16)
      end
    end
  end
end
