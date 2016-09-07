require_relative 'spec_helper'
# require '../lib/farmar_sale'

describe Sale do

  describe "#initialize" do
    it "should create an instance of Sale" do
      # time = DateTime.strptime('2013-11-13 01:49:37 -0800', '%Y-%m-%d %H:%M:%S %z')
      s = Sale.new(12, 100, '2013-11-13 01:49:37 -0800', 3, 1)
      s.must_be_instance_of(Sale)
    end

    it "should know about associated data file" do
      # s = Sale.new(12, 100, '2013-11-13 01:49:37 -0800', 3, 1)
      s = Sale.all
      s.class.must_equal(Hash)
    end
  end

  describe "all" do
    it "should return a hash" do
      s = Sale.all
      s.class.must_equal(Hash)
    end
  end

  describe "find" do
    it "should return an instance of the object" do
      s = Sale.find(3)
      # s.must_be_instance_of(Sale)
      s.id.must_equal(3)
    end
  end

end
