require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Market do
    let(:market_test) {Market.new(1, "name", "address", "city", "county", "ST", 98017)}
    let(:coop_market) {Market.new(1,"People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon",97202)}
    describe "#initialize" do
      it "should make a new instance of market" do
        # this just tests the basic "I can make a new instance of this class."
        market_test.must_be_instance_of(Market)
      end

      # I will need to get some information back from each instance of market - namely the name and the ID, check that a newly instantiated market will have these things.
      it "should respond to .id with a Fixnum" do
        market_test.id.must_be_instance_of(Fixnum)
      end
      it "should respond to .name with a String" do
        market_test.name.must_be_instance_of(String)
      end
      it "should respond to .address" do
        market_test.address.must_be_instance_of(String)
      end
    end
    describe "#self.all" do
      it "should return a collection of the markets included in the csv" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      # I think this will be a hash - key of market_id, and value of market_name, etc.
        Market.all.must_be_instance_of(Hash)
      end

      it "should contain a specific market in the csv" do
        # Check that the Hash contains a key of 2
        Market.all.keys.must_include(2)
      end
    end
    describe "#self.find(id)" do
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      it "should return an instance of Market when given an id" do
        Market.find(2).must_be_instance_of(Market)
      end

      it "should return the correct instance of Market when given an id" do
        Market.find(12).name.must_equal("Coxsackie Farmers' Market")
      end
    end
    describe "#vendors" do
      it "should return an array" do
        coop_market.vendors.must_be_instance_of(Array)
        # I'm going to make it an array of Vendors.
      end
      it "should return an array of Vendor objects" do
        # Check that the first item is a vendor.
        coop_market.vendors[0].must_be_instance_of(Vendor)
      end
      it "the vendor returned, should have a market_id that matches the market" do
        # Checking that the objects returned have the same id as the market instance I'm working with.
        # NOTE: It's not ACTUALLY the same object (same data, different object id), since I have created coop_market here. I wonder if I should check for the same object. I'm not sure how.
        # This will check using the market method in Vendor.
        coop_market.vendors[0].market_id.must_be_same_as(coop_market.id)
      end
    end
    describe "#prefered_vendor" do

      #prefered_vendor: returns the vendor with the highest revenue
      # I'm going to start with an array of all vendors for the MARKET.  (market.vendors), then I want to calculate the revenue for each vendor, and store it with the corresponding vendor (hash, where revenue is the key, value is an array of vendors with that revenue, in case there are more than one). then, call .max on the keys of the hash, get the key, call the value.
      it "should return a Vendor" do
        coop_market.prefered_vendor.must_be_instance_of(Vendor)
      end
      it "should return the vendor with highest revenue" do
        #not sure how to check this
        skip

      end
    end
  end
end
