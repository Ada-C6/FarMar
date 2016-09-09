require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    greenlake = FarMar::Market.new(123, "greenlake", "123 green", "Green Lake", "Seattle", "WA", "98105")

    it "should create a new instance" do
      greenlake.must_be_instance_of(FarMar::Market)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Market.all.must_be_kind_of(Hash)
    end
  end

  describe "self.find(id)" do
    it "should return an instance of the object where the value of the id field in the CSV matches the passed parameter" do
      FarMar::Market.find(1).id.must_equal(1)
    end
  end

  describe "#vendors" do
    let(:market_test) {FarMar::Market.find(2)}
    it "should return the correct number of FarMar::Vendor instances that are associated with the market instance" do
      # market_test = FarMar::Market.find(2)
      market_test.vendors.length.must_equal(3)
    end

    it "should return the correct id of the stated FarMar::Vendor instance that is associated with the market instance" do
      # market_test = FarMar::Market.find(2)
      market_test.vendors[0].id.must_equal(7)
    end

    it "should return true if the correct number of FarMar::Vendor instances that are associated with the market instance are returned by the indstance method" do
      market_test2 = FarMar::Market.find(1)
      market_test2.vendors.length.must_equal(6)
    end
  end

  # products returns a collection of FarMar::Product instances that are associated to the market through theFarMar::Vendor class.
  describe "#products" do
    let(:product_test) {FarMar::Market.find(2)}
    it "should returns a collection of FarMar::Product instances that are associated to the market through theFarMar::Vendor class" do
      product_test.products.length.must_equal(9)
    end

    it "should returns a the correct id of one item in the collection of FarMar::Product instances that are associated to the market through theFarMar::Vendor class" do
      puts product_test.products[0].id
      product_test.products[0].id.must_equal(14)
    end
  end

  # self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
  # describe "self.search(search_term)" do
  #   it "should returna collection of FarMar::Market instances where the market name or vendor name contain the search_term." do
  #
  #   end
  # end
end
