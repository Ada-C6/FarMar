require_relative 'spec_helper'
# require '../lib/farmar_product'

describe Product do

  describe "#initialize" do
    it "should create an instance of Product" do
      p = Product.new(123, "fruits", 12)
      p.must_be_instance_of (Product)
    end

    it "should know about associated data file" do
      p = Product.all
      p[4].name.must_equal("Yummy Fruit")
    end
  end

  describe "all" do
    it "should return a hash" do
      p = Product.all
      p.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      p = Product.find(11)
      p.id.must_equal(11)
      p.must_be_instance_of(Product)
      p.name.must_equal("Gigantic Bread")
    end
  end


end
