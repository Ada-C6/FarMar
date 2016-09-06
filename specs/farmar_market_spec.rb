require_relative 'spec_helper'

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
end
