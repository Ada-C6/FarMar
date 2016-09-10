require_relative 'spec_helper'

describe FarMar::Market do
    let(:my_market) { FarMar::Market.new(123, 'KellyMarket', '11000 NE 10th Street', 'Bellevue', 'King County', 'WA', 98004) }

    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            my_market.id.must_equal(123)
            my_market.name.must_equal('KellyMarket')
            my_market.address.must_equal('11000 NE 10th Street')
            my_market.city.must_equal('Bellevue')
            my_market.county.must_equal('King County')
            my_market.state.must_equal('WA')
            my_market.zip.must_equal(98004)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Market.all
            a[0].name.must_equal("People's Co-op Farmers Market")
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Market.find(1).name.must_equal("People's Co-op Farmers Market")
        end
    end

    describe "#vendors" do
        it "should return a collection of FarMar::Vendor instances that are associated with the market by the market_id field " do
            my_market.vendors.length.must_equal(6)
        end
    end
end
