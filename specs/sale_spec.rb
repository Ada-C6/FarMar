require_relative 'spec_helper'

describe FarMar::Sale do
  describe "#initialize" do
    test_sale = FarMar::Sale.new(1, 150, 3/5/15, 2, 5)

    it "should create a new instance" do
      test_sale.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Sale.all.must_be_kind_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object where the value of the id field in the CSV matches the passedparameter" do
      FarMar::Sale.find(1).id.must_equal(1)
    end
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale.vendor_id field
  describe "#vendor" do
    it "should be true if the FarMar::Vendor instance has an id that is associated with this sale using the FarMar::Sale vendor_id" do
      vendor_test = FarMar::Sale.find(4)
      # puts vendor_test.id
      # puts vendor_test.vendor_id
      vendor_test.vendor.id.must_equal(1)
    end
  end

  #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Saleproduct_id field
  describe "#product" do
    it "should be true if the FarMar::Product instanct id that is associated with this sale is correct, using the FarMar::Sale.product_id attribute" do
      product_test = FarMar::Sale.find(9)
      product_test.product.id.must_equal(4)
    end
  end

  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  describe "self.between(beginning_time, end_time)" do
    it "should return a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
      start_time = "2013-11-07 04:34:56 -0800"
      end_time = "2013-11-07 04:34:57 -0800"
      FarMar::Sale.between(start_time, end_time).length.must_equal(1)
    end

    it "should return a collection of FarMar::Sale objects > 1 where the purchase time is between the two times given as arguments" do
      start_time = "2013-11-07 04:30:00 -0800"
      end_time = "2013-11-07 06:00:00 -0800"
      FarMar::Sale.between(start_time, end_time).length.must_be(:>, 1)
    end

    it "should return an object with the correct date that has the same purchase_time as teh start_time given" do
      start_time = "2013-11-07 04:34:56 -0800"
      end_time = "2013-11-07 04:34:57 -0800"
      test_date = FarMar::Sale.between(start_time, end_time)[0].purchase_time
      test_date.must_equal(start_time)
    end
  end
end
