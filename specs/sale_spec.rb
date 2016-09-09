# require 'awesome_print'
require_relative 'spec_helper'

describe "FarMar::Sale" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Sale class" do
            FarMar::Sale.new({}).must_be_instance_of(FarMar::Sale)
        end
    end # initialize

    describe "self.all" do
        before(:all) do
            @csv_sales = FarMar::Sale.all

            # select a random value from csv_sales hash. range 0..12002 because csv contains 12002 unique sale IDs
            @random_sale = @csv_sales.values[rand(0..12001)]
        end

        it "should return a hash of FarMar::Sale objects (ideally with length matching CSV size)" do
            @csv_sales.class.must_equal(Hash)
            @random_sale.must_be_instance_of(FarMar::Sale)

            # csv contains 12002 unique sale IDs
            @csv_sales.length.must_equal(12002)
        end

        it "should parse the purchase_time string into a DateTime object" do
            @random_sale.purchase_time.must_be_instance_of(DateTime)
        end
    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Sale object with data that corresponds to the id argument passed in" do
            found_sale = FarMar::Sale.find(10837)
            found_sale.must_be_instance_of(FarMar::Sale)
            found_sale.sale_id.must_equal(10837)
            found_sale.amount.must_equal(6040)
            found_sale.purchase_time.must_be_instance_of(DateTime)
        end #
    end # self.find

    describe "self.between(beginning_time, end_time)" do
        # method to generate a random time within the sales.csv time ranges
        def random_time(from = DateTime.parse("2013-11-06 08:35:40 -0800").to_time, to = DateTime.parse("2013-11-13 08:35:16 -0800").to_time)
            Time.at(from + rand * (to.to_f - from.to_f))
        end #random_time

        # method to return two random times with the later time as second variable
        def two_times
            time_a = random_time
            time_b = random_time
            if time_a <= time_b
                return time_a, time_b
            else
                return time_b, time_a
            end
        end #two_times

        it "should return an array of FarMar::Sale objects" do
            times = two_times
            time_test_sales = FarMar::Sale.between(times[0], times[1])
            time_test_sales.must_be_instance_of(Array)
            time_test_sales[rand(0..time_test_sales.length-1)].must_be_instance_of(FarMar::Sale)
        end

        it "should return an array of objects with purchase_times in the given range" do
            test_begin_time = DateTime.parse("2013-11-07 06:40:47 -0800").to_time
            test_end_time = DateTime.parse("2013-11-07 13:07:38 -0800").to_time

            purchase_time_test = FarMar::Sale.between(test_begin_time, test_end_time)
            # ap purchase_time_test #@todo - remove/debug
            purchase_time_test.each do |sale|
                (sale.purchase_time.to_time >= test_begin_time).must_equal(true)
                (sale.purchase_time.to_time <= test_end_time).must_equal(true)
            end
        end
    end #self.between(beginning_time, end_time)

    describe "instance methods" do
        before(:all) do
            test_sale_info_hash = {
                sale_id: 9901,
                amount: 8097,
                purchase_time: DateTime.parse("2013-11-06 22:23:32 -0800"),
                vendor_id: 2231,
                product_id: 6785
            }

            @test_sale = FarMar::Sale.new(test_sale_info_hash)
            @test_vendor = @test_sale.vendor
            @test_product = @test_sale.product
        end

        describe "#vendor" do
            it "should return a FarMar::Vendor instance" do
                @test_vendor.must_be_instance_of(FarMar::Vendor)
            end

            it "should return the correct FarMar::Vendor with matching vendor_id" do
                @test_vendor.vendor_id.must_equal(2231)
            end
        end #vendor

        describe "#product" do
            it "should return a FarMar::Product instance" do
                @test_product.must_be_instance_of(FarMar::Product)
            end

            it "should return the correct FarMar::Product with matching product_id" do
                @test_product.product_id.must_equal(6785)
            end
        end #product

    end # instance methods
end # FarMar::Sale
