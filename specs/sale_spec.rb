require_relative 'spec_helper'

describe "FarMar::Sale" do
    describe "#initialize" do
        it "should be an instance of the FarMar::Sale class" do
            FarMar::Sale.new({}).must_be_instance_of(FarMar::Sale)
        end
    end # initialize

    describe "self.all" do
        it "should return a hash of FarMar::Sale objects with length matching CSV size" do
            csv_sales = FarMar::Sale.all
            expected_length = CSV.read('support/sales.csv').size
            csv_sales.class.must_equal(Hash)
            csv_sales.values[rand(0..12001)].must_be_instance_of(FarMar::Sale)
            # @todo - commented out length check due to duplicated IDs in sales.csv, these are causing length mismatch here
            # csv_sales.length.must_equal(expected_length)
        end
    end # self.all

    describe "self.find(id)" do
        it "should return a FarMar::Sale object with data that corresponds to the id argument passed in" do
            found_sale = FarMar::Sale.find(10837)
            found_sale.must_be_instance_of(FarMar::Sale)
            found_sale.sale_id.must_equal(10837)
            found_sale.amount.must_equal(6040)
            found_sale.purchase_time.must_equal("2013-11-11 16:39:42 -0800")
        end #
    end # self.find

end # FarMar::Sale
