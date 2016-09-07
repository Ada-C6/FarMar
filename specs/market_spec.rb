require_relative 'spec_helper'

describe "FarMar::Market" do

    describe "#initialize" do
        it "should be an instance of the FarMar::Market class" do
            FarMar::Market.new({}).must_be_instance_of(FarMar::Market)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Market objects with quantity matching CSV length" do
            csv_markets = FarMar::Market.all
            csv_markets.class.must_equal(Hash)
            csv_markets.values[rand(1..500)].must_be_instance_of(FarMar::Market)
            expected_length = CSV.read('support/markets.csv').size
            csv_markets.length.must_equal(expected_length)
        end

    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Market object with data that corresponds to the id argument passed in" do
            found_market = FarMar::Market.find(126)
            found_market.must_be_instance_of(FarMar::Market)
            found_market.id.must_equal(126)
            found_market.zip.must_equal("65536")
        end #
    end # self.find

end # FarMar::Market
