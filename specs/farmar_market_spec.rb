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
    all_markets = FarMar::Market.all

    it "should return an array" do
      all_markets.must_be_kind_of(Array)
    end

    it "should return an array of FarMar::Market instances" do
      all_markets[8].must_be_instance_of(FarMar::Market)
    end

    it "should return a collection of FarMar::Market instances created from the CSV file" do
      all_markets[6].name.must_equal("Petaluma Evening Farmers' Market")
    end
  end

  describe "self.find(id)" do
    market_12 = FarMar::Market.find(12)

    it "should return an instance of FarMar::Market" do
      market_12.must_be_instance_of(FarMar::Market)
    end

    it "should return the instance of FarMar::Market that matches the passed id" do
      market_12.id.must_equal(12)
    end

    it "should return the instance of FarMar::Market that matches the passed id, check for name" do
      market_12.name.must_equal("Coxsackie Farmers' Market")
    end

  end

  describe "#vendors" do
    silverdale = FarMar::Market.find(2)

    it "should return a collection of FarMar::Vendor instances associated with the market" do
      silverdale.vendors.must_be_kind_of(Array)
    end

    it "should return an array of the vendors associated with silverdale market" do
      vendors = silverdale.vendors
      vendor_names = vendors.map do |vendor|
        vendor.name
      end
      vendor_names.must_include("Quigley, Breitenberg and Schuster")
    end
  end

  describe "find_by_name(name)" do
    it "should return the instance that matches the passed name" do
      FarMar::Market.find_by_name("Coxsackie Farmers' Market").id.must_equal(FarMar::Market.find(12).id)
    end

  end

  describe "find_all_by_state(state)" do
    it "should return an array of instances that match the passed state" do
      markets_wa = FarMar::Market.find_all_by_state("Washington")

      markets_wa[rand(1..(markets_wa.length - 1))].state.upcase.must_equal("WASHINGTON")

    end
  end

  describe "#products" do
    market_products = FarMar::Market.find(77).products

    it "should return an array of Product instances" do
      market_products[rand(0..(market_products.length - 1))].must_be_instance_of(FarMar::Product)
    end

    it "should return an array of Products associated to the market through the Vendor class" do
      vendor_id = market_products[rand(0..(market_products.length - 1))].vendor_id
      market_id = FarMar::Vendor.find(vendor_id).market_id
      market_id.must_equal(77)
    end

  end

  describe "self.search(search_term)" do
    search_king = FarMar::Market.search("king")

    it "should return an array of Market instances" do
      search_king[0].must_be_instance_of(FarMar::Market)
    end

    it "should return an array of Market instances where market name matches search term" do
      names = search_king.map do |market|
        market.name.upcase
      end
      names.must_include("KING FARMERS MARKET")
    end

    it "should return an array of Market instances where vendor name matches search term" do
      matching_vendors = []
      search_king.each do |market|
        matching_vendors += market.vendors
      end

      vendor_names = matching_vendors.map do |vendor|
        vendor.name
      end
      vendor_names.must_include("Kulas, King and Kohler")
    end

  end

  describe "#preferred_vendor" do
    market_12 = FarMar::Market.find(12)

    it "should return a Vendor instance" do
      market_12.preferred_vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should return the vendor with the highest revenue" do
      market_12.preferred_vendor.revenue.must_be(:>, FarMar::Vendor.find(53).revenue)
    end

  end

  # describe "#preferred_vendor_by_date(date)" do
  #   market_99 = FarMar::Market.find(99)
  #   date = DateTime.new(2013, 11, 7, 0, 0, 0, '-8')
  #
  #   it "should return the vendor with the highest revenue for the given date" do
  #     market_99.preferred_vendor_by_date(date)
  #   end
  # end

end
