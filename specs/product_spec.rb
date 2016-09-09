require_relative 'spec_helper'

describe "FarMar::Product" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Product class" do
            FarMar::Product.new({}).must_be_instance_of(FarMar::Product)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Product objects with length matching CSV size" do
            csv_products = FarMar::Product.all
            expected_length = CSV.read('support/products.csv').size
            csv_products.class.must_equal(Hash)
            csv_products.values[rand(0..expected_length-1)].must_be_instance_of(FarMar::Product)
            csv_products.length.must_equal(expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Product object with data that corresponds to the id argument passed in" do
            found_product = FarMar::Product.find(272)
            found_product.must_be_instance_of(FarMar::Product)
            found_product.product_id.must_equal(272)
            found_product.name.must_equal("Wide-eyed Fish")
        end #
    end # self.find

    describe "self.by_vendor(vendor_id)" do
        it "should raise an ArgumentError if not passed a Fixnum argument" do
            proc { FarMar::Product.by_vendor("cats") }.must_raise(ArgumentError)
        end

        it "should return an array of FarMar::Product instances" do
            by_vendor_product = FarMar::Product.by_vendor(rand(0..2690)) #products.csv contains 2690 vendors
            by_vendor_product.must_be_instance_of(Array)
            by_vendor_product[rand(0..by_vendor_product.length-1)].must_be_instance_of(FarMar::Product)
        end

        it "should return FarMar::Product instances with vendor_id matching the argument" do
            rand_id = rand(0..2690)
            rand_vendors = FarMar::Product.by_vendor(rand_id)
            rand_vendors[rand(0..rand_vendors.length-1)].vendor_id.must_equal(rand_id)
        end
    end # self.by_vendor

    describe "instance methods" do
        before(:all) do
            # Make a new product instance from a single line of products.csv
            test_product_info_hash = {
                product_id: 7818,
                name: "Purple Beets",
                vendor_id: 2566
            }
            @test_product = FarMar::Product.new(test_product_info_hash)

            @test_vendor = @test_product.vendor
            @test_sales = @test_product.sales
        end # before(:each)

        describe "#vendor" do
            it "should return a FarMar::Vendor instance with the correct vendor_id" do
                @test_vendor.must_be_instance_of(FarMar::Vendor)
                @test_vendor.vendor_id.must_equal(2566)
            end
        end #vendor

        describe "#sales" do
            it "should return an array of FarMar::Sale instances" do
                @test_sales.must_be_instance_of(Array)
                @test_sales[rand(0..@test_sales.length-1)].must_be_instance_of(FarMar::Sale)
            end

            it "should return the FarMar::Sale instances with the correct product_id" do
                @test_sales[rand(0..@test_sales.length-1)].product_id.must_equal(7818)
            end
        end #sales


        describe "#number_of_sales" do
            it "should return the correct quantity of product sales" do
                @test_product.number_of_sales.must_equal(3)
            end
        end #number_of_sales
    end # instance methods before(:each) block
end # FarMar::Product
