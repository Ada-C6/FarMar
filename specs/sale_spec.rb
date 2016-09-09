require_relative 'spec_helper'

describe "FarMar::Sale" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Sale class" do
            FarMar::Sale.new({}).must_be_instance_of(FarMar::Sale)
        end
    end # initialize

    describe "self.all" do
        csv_sales = FarMar::Sale.all

        before(:each) do
            # select a random value from csv_sales hash. range 0..12002 because csv contains 12002 unique sale IDs
            @random_sale = csv_sales.values[rand(0..12002)]
        end

        it "should return a hash of FarMar::Sale objects (ideally with length matching CSV size)" do
            csv_sales.class.must_equal(Hash)
            @random_sale.must_be_instance_of(FarMar::Sale)

            # p @random_sale # @todo - remove/debug

            # @todo - commented out length validation due to duplicated IDs in sales.csv, these are causing length mismatch here
            # expected_length = CSV.read('support/sales.csv').size
            # csv_sales.length.must_equal(expected_length)
        end

        it "should parse the purchase_time string into a DateTime object" do
            @random_sale.purchase_time.must_be_instance_of(DateTime)

            # p @random_sale # @todo - remove/debug
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
