require_relative 'spec_helper'
# require '../lib/farmar_sale'

describe Sale do
  let s = Sale.new(12, 100, '2013-11-13 01:49:37 -0800', 3, 1)
  let all = Sale.all

  describe "#initialize" do
    it "should create an instance of Sale" do
      # time = DateTime.strptime('2013-11-13 01:49:37 -0800', '%Y-%m-%d %H:%M:%S %z')
      # s = Sale.new(12, 100, '2013-11-13 01:49:37 -0800', 3, 1)
      s.must_be_instance_of(Sale)
    end

    it "should know about associated data file" do
      # s = Sale.new(12, 100, '2013-11-13 01:49:37 -0800', 3, 1)
      # s = Sale.all
      all.class.must_equal(Hash)
    end
  end

  describe "all" do
    it "should return a hash" do
      # s = Sale.all
      all.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      find_s = Sale.find(3)
      find_s.must_be_instance_of(Sale)
      find_s.id.must_equal(3)
    end
  end

  describe "#vendor" do
    it "should return the Vendor instance that is associated with the sale using Sale vendor_id" do
      vend = s.vendor
      vend.id.must_equal(3)
      vend.name.must_equal("Breitenberg Inc")
    end
  end

  describe "#product" do
    it "should return the Product instance associated with the sale using the Sale product id" do
      s.product.must_be_instance_of(Product)
      s.product.id.must_equal(1)
    end
  end

  describe "between" do
    it "should return a collection of Sale objects where the purchase time is between the two times given as arguments" do
      Sale.between('2013-11-13 01:48:00 -0800', '2013-11-13 01:50:59 -0800').length.must_equal(8)
    end
  end

end
