require_relative 'spec_helper'

describe FarMar::Vendor do
    let(:my_vendor) { FarMar::Vendor.new(456, 'VendorKelly', 5, 123) }

    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            my_vendor.id.must_equal(456)
            my_vendor.name.must_equal('VendorKelly')
            my_vendor.num_of_employees.must_equal(5)
            my_vendor.market_id.must_equal(123)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Vendor.all
            a[0].name.must_equal("Feil-Farrell")
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Vendor.find(1).name.must_equal("Feil-Farrell")
        end
    end

    describe "#market" do
        it "should return the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field" do
            my_vendor.market.name.must_equal("High Desert Growers' Farmers' Market")
        end
    end

    describe "#products" do
        let(:my_vendors_products) { my_vendor.products }

        it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field" do
            my_vendors_products.length.must_equal(4)
            my_vendors_products.first.name.must_equal("Cooing Honey")
            my_vendors_products.last.name.must_equal("Salty Mushrooms")
        end
    end

    describe "#sales" do
        let(:my_vendors_sales) { my_vendor.sales }

        it "returns a collection of FarMar::Sale instances that are associated by the vendor_id field" do
            my_vendors_sales.length.must_equal(8)
            my_vendors_sales.first.amount.must_equal(3790)
            my_vendors_sales.last.amount.must_equal(7472)
        end
    end

    describe "#revenue" do
        it "returns the the sum of all of the vendor's sales (in cents)" do
            my_vendor.revenue.must_equal(55225)
        end
    end

    describe "self.by_market(market_id)" do
        it "returns all of the vendors with the given market_id" do
            b = FarMar::Vendor.by_market(123)
            b.length.must_equal(6)
            b.must_equal(["Nolan Group", "Runolfsson, Greenholt and Rutherford", "Daugherty, Bogisich and Crist", "Spinka-Rowe", "Keebler-Kessler", "Greenholt, Hickle and Kozey"])
        end
    end
end
