require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    test_vendor = FarMar::Vendor.new(784, "honeybees", 4, 560)

    it "should create a new instance" do
      test_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Vendor.all.must_be_kind_of(Hash)
    end
  end

  # should return an instance of the object where the value of the id field in the CSV matches the passed parameter
  describe "self.find(id)" do
    it "should return true if the passed parameter of through the class method returns an instance that matches the id field in the CSV file" do
      FarMar::Vendor.find(2).id.must_equal(2)
    end
  end

  describe "#market" do
    it "should return True if the correct FarMar::Market instance that is associated with this vendor is outputed using the FarMar::Vendor.market_id field" do
      vendor_9 = FarMar::Vendor.find(9)
      puts vendor_9
      vendor_9.market.id.must_equal(2)
    end
  end

  describe "#products" do
    let(:product_test) {FarMar::Vendor.find(5)}
    it "should return true if the number of FarMar::Product instances that are associated with the vendor instance is correct" do
      product_test.products.length.must_equal(3)
    end

    it "should return true if the correct FarMar::Product id from the collection of instances that are associated with the vendor instance is correct" do
      product_test.products[0].id.must_equal(8)
    end
  end

  describe "self.by_market(market_id)" do
    it "should return an array of vendors with the given market_id" do
      FarMar::Vendor.by_market(2).must_be_kind_of(Array)
    end

    it "should return True if the correct number of vendors is returned for the given market_id" do
      FarMar::Vendor.by_market(2).length.must_equal(3)
    end

    it "should return true if the correct vendor id from the collection of instances that are associated with the market id is correct" do
      FarMar::Vendor.by_market(2)[0].id.must_equal(7)
    end

  end

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  describe "#sales" do
    it "should return true if a sample of the collection of FarMar::Sale instances associated with the correct vendor_id field given are the same" do
      sales_test = FarMar::Vendor.find(1)
      # puts sales_test.id
      # puts sales_test.sales
      # sales_test.sales.length.must_equal(1)
      # sales_test.sales[1].length.must_equal(7)
      sales_test.sales.length.must_equal(7)


    end
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  describe "#revenue" do
    it "should return true if the sum of all of the vendor's sales(in cents) is correct" do
      revenue_test = FarMar::Vendor.find(4)
      revenue_test.revenue.must_equal(26866)
    end
  end

  # describe "self.most_revenue(n)" do
  #   it "should return the top n vendor instances ranked by total revenue" do
  #     FarMar::Vendor.most_revenue(1).length.must_equal(1)
  #   end
  # end
end
