require_relative 'spec_helper'

describe FarMar::Product do
    let(:my_product) { FarMar::Product.new(1, 'Dry Beets', 1) }

    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            my_product.id.must_equal(1)
            my_product.name.must_equal('Dry Beets')
            my_product.vendor_id.must_equal(1)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Product.all
            a[0].name.must_equal("Dry Beets")
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Product.find(1).name.must_equal("Dry Beets")
        end
    end

    describe "#vendor" do
        it "returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field" do
            my_product.vendor.name.must_equal("Feil-Farrell")
        end
    end

    describe "#sales" do
        let(:my_products_sales) { my_product.sales }

        it "returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field" do
            my_products_sales.length.must_equal(7)
            my_products_sales.first.amount.must_equal(9290)
            my_products_sales.last.amount.must_equal(4095)
        end
    end

    describe "#number_of_sales" do
        it "returns the number of times this product has been sold" do
            my_product.number_of_sales.must_equal(7)
        end
    end

    describe "self.by_vendor(vendor_id)" do
        it "returns all of the products with the given vendor_id" do
            FarMar::Product.by_vendor(123).must_equal(["Spotty Mushrooms", "Bad Carrots", "Slow Mushrooms"])
        end
    end
end
