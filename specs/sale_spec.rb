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

end
