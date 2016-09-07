require_relative 'spec_helper'
require 'csv'

describe FarMar::Product do
  describe "#initialize" do
    it "can initialize a new instance of Product" do
      product = FarMar::Product.new("1","Dry Beets","1")
      product.must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Product.all.length.must_equal(8193)
    end
  end

  describe "self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Product.all
      FarMar::Product.find(8166).name.must_equal("Faithful Apples")
    end
  end

  describe "#vendor" do
    it "should return the FarMar::Vendor instances associated by product" do
       prdct = FarMar::Product.new("7","Quaint Beef","4")
       prdct.vendor.name.must_equal("Bechtelar Inc")
    end
  end

  describe "#sales" do
    it "should return a collection of FarMar::Sales assocated with the product" do
      prdct = FarMar::Product.new("7","Quaint Beef","4")
      sale_ids = []
      prdct.sales.each do |line|
        sale_ids.push(line.id)
      end
      sale_ids.must_equal(["17", "21"])
    end
  end

  describe "#number_of_sales" do
    it "should return the number of times the product has been sold" do
      prdct = FarMar::Product.new("7","Quaint Beef","4")
      prdct.number_of_sales.must_equal(2)
    end
  end


end
#
# 17,3442,2013-11-10 04:16:12 -0800,4,7
# 21,8963,2013-11-10 12:26:30 -0800,4,7

# describe "#market" do
#   it "should return the FarMar::Market instance associated with vendor" do
#     ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
#     ven.market.name.must_equal("Dolgeville Farmer's Market")
#   end
# end
#
# describe "#products" do
#   it "should return a collection of FarMar::Product instances associated by vendor_id" do
#     ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
#     vnames = []
#     ven.products.each do |item|
#       vnames.push(item.name)
#     end
#     vnames.must_equal(["Calm Carrots", "Fierce Beef", "Helpless Bread", "Yummy Bread", "Broken Beets"])
#   end
# end
#
# describe "#sales" do
#   it "should return a collection of FarMar::Sale instances associated by vendor_id" do
#     ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
#     vsales = []
#     ven.sales.each do |item|
#       vsales.push(item.id)
#     end
#     vsales.must_equal(["53", "54", "55", "56", "57", "58", "59", "60"])
#   end
# end
#
# describe "#revenue" do
#   it "should return the num of all the vendor sales (in cents)" do
#     ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
#     ven.revenue.must_equal(32628)
#   end
# end
