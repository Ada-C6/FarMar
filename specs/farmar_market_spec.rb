require_relative 'spec_helper'
require_relative '../lib/farmar_market'

describe FarMar::Market do
    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            # (id, name, address, city, county, state, zip)
            a = FarMar::Market.new(123, 'KellyMarket', '9th NE 6 Drive', 'Sammmamish', 'King County', 'WA', 98074)
            a.id.must_equal(123)
            a.name.must_equal('KellyMarket')
            a.address.must_equal('9th NE 6 Drive')
            a.city.must_equal('Sammmamish')
            a.county.must_equal('King County')
            a.state.must_equal('WA')
            a.zip.must_equal(98074)
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
            kelly_market = FarMar::Market.new(141, 'KellyMarket', '9th NE 6 Drive', 'Sammmamish', 'King County', 'WA', 98074)
            vendors = kelly_market.vendors
            vendors.length.must_equal(9)
        end
    end
    #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
end
