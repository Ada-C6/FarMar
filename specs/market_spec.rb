require_relative 'spec_helper'

describe "FarMar::Market" do

    describe "#initialize" do
        it "should be an instance of the FarMar::Market class" do
            FarMar::Market.new({}).must_be_instance_of(FarMar::Market)
        end
    end # initialize

    describe "self.all" do
        before(:all) do
            @csv_markets = FarMar::Market.all
            @expected_length = CSV.read('support/markets.csv').size
        end

        it "should return a hash of FarMar::Market objects with length matching CSV size" do
            @csv_markets.class.must_equal(Hash)

            @csv_markets.values.each do |market|
                market.must_be_instance_of(FarMar::Market)
            end
        end

        it "should return a hash with length matching the CSV size" do
            @csv_markets.length.must_equal(@expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        let(:found_market) { FarMar::Market.find(126) }

        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Market.find("cats") }.must_raise(ArgumentError)
        end

        it "should return a FarMar::Market object" do
            found_market.must_be_instance_of(FarMar::Market)
        end

        it "should return a FarMar::Market object with correct market_id" do
            found_market.market_id.must_equal(126)
        end

        it "should return a FarMar::Market object with correct zip" do
            found_market.zip.must_equal("65536")
        end
    end # self.find

    describe "instance methods" do
        before(:all) do
            test_market_info_hash = {
                market_id: 480,
                name: "Prescott Farmers Market",
                address: "1100 E. Sheldon Street",
                city: "Prescott",
                county: "Yavapai",
                state: "Arizona",
                zip: "86301"
            }

            @test_market = FarMar::Market.new(test_market_info_hash)
            # assign result of #vendors method on test_market to a variable for use below
            @test_vendors = @test_market.vendors
        end # before(:each)

        describe "#vendors" do
            it "should return an array of FarMar::Vendor instances" do
                @test_vendors.must_be_instance_of(Array)
                @test_vendors.each do |vendor|
                    vendor.must_be_instance_of(FarMar::Vendor)
                end
            end

            it "should return FarMar::Vendor instances with the correct market_id" do
                @test_vendors.each do |vendor|
                    vendor.market_id.must_equal(480)
                end
            end
        end # #vendors
    end # instance methods

end # FarMar::Market
