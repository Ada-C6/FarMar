require_relative 'spec_helper'

describe "FarMar::Product" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Product class" do
            FarMar::Product.new.must_be_instance_of(FarMar::Product)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Product objects with length matching CSV size" do
            csv_products = FarMar::Product.all
            expected_length = CSV.read('support/products.csv').size
            csv_products.class.must_equal(Hash)
            csv_products.values[rand(0..expected_length)].must_be_instance_of(FarMar::Product)
            csv_products.length.must_equal(expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Product object with data that corresponds to the id argument passed in" do
            found_product = FarMar::Product.find(272)
            found_product.must_be_instance_of(FarMar::Product)
            found_product.id.must_equal(272)
            found_product.zip.must_equal("Wide-eyed Fish")
        end #
    end # self.find

end # FarMar::Product
