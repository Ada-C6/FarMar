require_relative 'spec_helper'
# require '../lib/farmar_vendor'

describe Vendor do

  describe "#initialize" do
    it "should create an instance of Vendor" do
      v = Vendor.new(123, "name", 24, 31)
      v.must_be_instance_of(Vendor)
    end

    it "should know about associated data file" do
      v = Vendor.all
      v.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      v = Vendor.find(5)
      v.must_be_instance_of(Vendor)
      v.employees.must_equal(3)
    end
  end


end
