require_relative 'spec_helper'
require 'csv'

describe FarMar::Product do
  describe "#initialize" do

    #Example, use of the let. Note, this would be used better if we had it "..." do statements within each describe that need to be initialized in the same way.

    let(:product) { FarMar::Product.new("1","Dry Beets","1") }

    it "can initialize a new instance of Product" do
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

  describe "#self.by_vendor(vendor_id)" do
    it "should return all products with given vendor_id" do
      FarMar::Product.by_vendor(8).length.must_equal(4)
    end
  end

  #OPTIONAL REQUIREMENTS: PART 1 - My attempts that just created errors

  describe "self.revenue" do
    it "should return the revenue of each product" do
      FarMar::Product.revenue[3].must_equal(8193)
    end
  end

  # describe "self.most_revenue(n)" do
  #   it "should return the top n product instances by total revenue" do
  #     FarMar::Product.most_revenue(n).length.must_equal(8)
  #   end
  # end

end
