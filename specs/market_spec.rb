require_relative 'spec_helper'

describe "FarMar::Market" do

    describe "#initialize" do
        it "should be an instance of the FarMar::Market class" do
            FarMar::Market.new({}).must_be_instance_of(FarMar::Market)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Market objects with length matching CSV size" do
            csv_markets = FarMar::Market.all
            expected_length = CSV.read('support/markets.csv').size
            csv_markets.class.must_equal(Hash)
            csv_markets.values[rand(0..expected_length)].must_be_instance_of(FarMar::Market)
            csv_markets.length.must_equal(expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Market object with data that corresponds to the id argument passed in" do
            found_market = FarMar::Market.find(126)
            found_market.must_be_instance_of(FarMar::Market)
            found_market.market_id.must_equal(126)
            found_market.zip.must_equal("65536")
        end #
    end # self.find

    describe "#vendors" do
        # Make a new market instance from a single line of markets.csv
        test_market_array = CSV.read('support/markets.csv')[200]
        test_market_info_hash = {
            market_id: test_market_array[0].to_i,
            name: test_market_array[1],
            address: test_market_array[2],
            city: test_market_array[3],
            county: test_market_array[4],
            state: test_market_array[5],
            zip: test_market_array[6]
        }
        test_market = FarMar::Market.new(test_market_info_hash)

        # assign result of #vendors method on test_market to a variable for use below
        test_vendors = test_market.vendors

        it "should return an array of FarMar::Vendor instances" do
            test_vendors.must_be_instance_of(Array)
            test_vendors[rand(0..test_vendors.length-1)].must_be_instance_of(FarMar::Vendor)
        end

        it "should return FarMar::Vendor instances with the correct market_id" do
            test_vendors[rand(0..test_vendors.length-1)].market_id.must_equal(test_market.market_id)
        end
    end # #vendors

end # FarMar::Market
