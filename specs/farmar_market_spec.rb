require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    market = FarMar::Market.new(5, "Columbia City Farmers Market", "40 S Edmunds Rd", "Seattle", "King", "WA", "98118")

    it "should create an instance of FarMar::Market class" do
      market.must_be_instance_of(FarMar::Market)
    end

    it "should pass 7 arguments: ID - (Fixnum), Name - (String), Address - (String), City - (String), County - (String), State - (String), Zip - (String) and allow reading of ID" do
      market.id.must_equal(5)
    end

  end

  describe "self.all" do
    it "should return an array" do
      FarMar::Market.all.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Market instances" do
      FarMar::Market.all[8].must_be_instance_of(FarMar::Market)
    end

    it "should return a collection of FarMar::Market instances created from the CSV file" do
      FarMar::Market.all[6].name.must_equal("Petaluma Evening Farmers' Market")
    end
  end

  describe "self.find(id)" do
    it "should return an instance of FarMar::Market" do
      FarMar::Market.find(12).must_be_instance_of(FarMar::Market)
    end

    it "should return the instance of FarMar::Market that matches the passed id" do
      FarMar::Market.find(12).id.must_equal(12)
    end

    it "should return the instance of FarMar::Market that matches the passed id, check for name" do
      FarMar::Market.find(12).name.must_equal("Coxsackie Farmers' Market")
    end

  end

end
