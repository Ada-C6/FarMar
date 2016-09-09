require_relative 'spec_helper'

describe "FarMar::Vendor" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Vendor class" do
            FarMar::Vendor.new({}).must_be_instance_of(FarMar::Vendor)
        end
    end # initialize

    describe "self.all" do
        before(:all) do
            @csv_vendors = FarMar::Vendor.all
            @csv_length = CSV.read('support/vendors.csv').size
        end

        it "should return a hash" do
            @csv_vendors.class.must_equal(Hash)
        end

        it "items in the hash should be FarMar::Vendor objects" do
            @csv_vendors.values.each do |vendor|
                vendor.must_be_instance_of(FarMar::Vendor)
            end
        end

        it "length of the hash should match length of the CSV" do
            @csv_vendors.length.must_equal(@csv_length)
        end
    end # self.all

    describe "self.find(id)" do
        let(:found_vendor) { FarMar::Vendor.find(2468) }

        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Vendor.find("cats") }.must_raise(ArgumentError)
        end

        it "should return a FarMar::Vendor object" do
            found_vendor.must_be_instance_of(FarMar::Vendor)
        end #

        it "should return a FarMar::Vendor object with vendor_id equal to the parameter passed in" do
            found_vendor.vendor_id.must_equal(2468)
        end #

        it "should return a FarMar::Vendor object with correct name" do
            found_vendor.name.must_equal("Tillman-Schowalter")
        end #
    end # self.find

    describe "self.by_market(market_id)" do
        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Vendor.by_market("cats") }.must_raise(ArgumentError)
        end

        it "should return an array of FarMar::Vendor instances" do
            by_market_vendors = FarMar::Vendor.by_market(rand(0..499)) #vendors.csv contains 500 markets
            by_market_vendors.must_be_instance_of(Array)

            by_market_vendors.each do |vendor|
                vendor.must_be_instance_of(FarMar::Vendor)
            end
        end

        it "should return FarMar::Vendor instances with market_id matching the argument" do
            rand_id = rand(0..499)
            rand_vendors = FarMar::Vendor.by_market(rand_id)

            rand_vendors.each do |vendor|
                vendor.market_id.must_equal(rand_id)
            end
        end
    end # self.by_market

    describe "instance methods" do
        before(:all) do
            test_vendor_info_hash = {
                vendor_id: 914,
                name: "Wyman-Stamm",
                employees: 4,
                market_id: 170
            }

            @test_vendor = FarMar::Vendor.new(test_vendor_info_hash)
            @test_products = @test_vendor.products
            @test_sales = @test_vendor.sales
            @test_revenue = @test_vendor.revenue
        end

            describe "#market" do
                it "should return a FarMar::Market object with the correct market_id" do
                    @test_vendor.market.must_be_instance_of(FarMar::Market)
                    @test_vendor.market.market_id.must_equal(170)
                end
            end #market

            describe "#products" do
                it "should return an array of FarMar::Product objects" do
                    @test_products.must_be_instance_of(Array)
                    @test_products.each do |product|
                        product.must_be_instance_of(FarMar::Product)
                    end
                end

                it "should return FarMar::Product instances with the correct vendor_id" do
                    @test_products.each do |product|
                        product.vendor_id.must_equal(914)
                    end
                end
            end #products

            describe "#sales" do
                it "should return an array of FarMar::Sale objects" do
                    @test_sales.must_be_instance_of(Array)

                    @test_sales.each do |sale|
                        sale.must_be_instance_of(FarMar::Sale)
                    end
                end

                it "should return FarMar::Sale objects with the correct vendor_id" do
                    @test_sales.each do |sale|
                        sale.vendor_id.must_equal(914)
                    end
                end
            end #sales

            describe "#revenue" do
                it "should return a Fixnum of the correct revenue" do
                    @test_revenue.must_be_instance_of(Fixnum)
                    @test_revenue.must_equal(46229)
                end
            end #revenue

    end # instance methods before(:each)
end # FarMar::Vendor
