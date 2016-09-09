require_relative 'spec_helper'

describe FarMar::Sale do
    let(:transact) { FarMar::Sale.new(1, 9290, '2013-11-07 04:34:56 -0800', 1, 1) }

    describe "#initialize" do
        it "should return the correct values of instance variables that were established after initializing" do
            transact.id.must_equal(1)
            transact.amount.must_equal(9290)
            transact.purchase_time.must_equal(DateTime.parse('2013-11-07 04:34:56 -0800'))
            transact.vendor_id.must_equal(1)
            transact.product_id.must_equal(1)
        end
    end

    describe "self.all" do
        it "should return a collection of instances, representing all of the objects described in the CSV" do
            a = FarMar::Sale.all
            a[0].amount.must_equal(9290)
        end

    end

    describe "self.find(id)" do
        it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
            FarMar::Sale.find(456).amount.must_equal(9450)
        end
    end

    describe "#vendor" do
        it "returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
            transact.vendor.name.must_equal("Feil-Farrell")
        end
    end

    describe "#product" do
        it "returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field" do
            transact.product.name.must_equal("Dry Beets")
        end
    end

    describe "self.between(beginning_time, end_time)" do
        let(:timeframe) { FarMar::Sale.between('2013-11-06 20:44:00 -0800', '2013-11-07 04:34:56 -0800')}

        it "returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
            timeframe.length.must_equal(595)
            timeframe.first.amount.must_equal(8296)
            timeframe.last.amount.must_equal(5200)
        end
    end
end
