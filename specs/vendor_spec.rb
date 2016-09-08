require_relative 'spec_helper'

module FarMar
  describe Vendor do
    let(:ven) {Vendor.new(1, "vendor name", 1, 1)}
    let(:some_vendor) {Vendor.new(28,"Watsica and Sons",10,8)}

    describe "#initialize" do
      it "should make a new instance of vendor" do
        #write something here to test new instance of vendor
        ven.must_be_instance_of(Vendor)
        # ID - (Fixnum) uniquely identifies the vendor
        # Name - (String) the name of the vendor (not guaranteed unique)
        # No. of Employees - (Fixnum) How many employees the vendor has at the market
        # Market_id - (Fixnum) a reference to which market the vendor attends
      end
      it "should respond to .name with a string" do
        ven.name.must_be_instance_of(String)
      end

      it "should respond to .name with the correct name" do
        ven.name.must_equal("vendor name")
      end
    end

    describe "#self.all" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      it "should return a collection of Vendor objects" do
        # I'm going to use the id as the key, rest of info as value.
        Vendor.all.must_be_instance_of(Hash)
      end
      it "should contain a specific Vendor object, given the key" do
        Vendor.all.must_include(2)
      end
    end

    describe "self.find(id)" do
      # self.find(id): returns an instance of the object where the value of the id  field in the CSV matches the passed parameter.
      it "should return a vendor, given an id" do
        Vendor.find(2).must_be_instance_of(Vendor)
      end

      it "should return the correct name given the id" do
        Vendor.find(74).name.must_equal("Haag-Padberg")
        # 74,Haag-Padberg,3,17
      end
    end

    describe "#market" do
      #market: returns the FarMar::Market instance that is associated with this   vendor using the FarMar::Vendor market_id field
      let(:feil_f) {Vendor.new(1,"Feil-Farrell",8,1)}
      it "should return the market object that is associated with the market_id" do
        #this seems like it'll use Market.find ?
        feil_f.market.name.must_equal("People's Co-op Farmers Market")
      end
      it "should return a market object" do
        feil_f.market.must_be_instance_of(Market)
      end
    end

    describe "self.by_market" do
      # self.by_market(market_id): returns all of the vendors with the given market_id
      it "should return an array" do
        Vendor.by_market(1).must_be_instance_of(Array)
      end

      it "should be an array of Vendors" do
        Vendor.by_market(1)[0].must_be_instance_of(Vendor)
      end
    end

    describe "#products" do
      # Products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
      # This is going to call the Products.by_vendor(vendor_id) method!
      it "should return an array" do
        some_vendor.products.must_be_instance_of(Array)
        # I'm going to make it an array of Products.
      end
      it "should return an array of Product objects" do
        # Check that the first item is a vendor.
        some_vendor.products[0].must_be_instance_of(Product)
      end
      it "the products returned should have a vendor_id that matches the vendor" do
        # Checking that the objects returned have the same id as the vendor instance I'm working with.
        # NOTE: It's not ACTUALLY the same object (same data, different object id), since I have created some_vendor here in the test.
        # This will check using the Vendor method in Product.
        some_vendor.products[0].vendor_id.must_be_same_as(some_vendor.id)
      end
    end
    describe "#sales" do
      #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
      # for this vendor object, I should get the list of products associated with it, then call product.sales for each of those products, which should return a collection of sales (as a hash, keyed off of product_id).
      it "should return a Hash" do
        some_vendor.sales.must_be_instance_of(Hash)
      end
      it "should return a Hash where the keys are Products" do
        some_vendor.sales.keys[0].must_be_instance_of(Product)
      end
      it "should return a Hash where the values are an array of Sales" do
        some_vendor.sales.values[0].must_be_instance_of(Array)
      end
      it "elements within the value Arrays should be Sale objects" do
        #it is possible I'll have an empty array if there are no sales for a given product.
        some_vendor.sales.values[0][0].must_be_instance_of(Sale)
      end
      it "should return Sales where the vendor_id is the same as it's vendor_id" do
        some_vendor.sales.values[0][0].vendor_id.must_equal(some_vendor.id)
      end
    end

    describe "#revenue" do
      #revenue: returns the the sum of all of the vendor's sales (in cents)
      #probably uses the #sales method, grabs the amount associated with each sale, and then reduces (:+) them to a sum?
      #sales returns a hash with key value pairs of product: [array of sales], so I'll want to iterate through each array of sales, grab the sale.amount, make a collection of those, and reduce them to the sum. Then for each product, I'll have a a total sale amount. (maybe use a map here), and I can then reduce again to get the total revenue.
      it "should return a Fixnum" do
        some_vendor.revenue.must_be_instance_of(Fixnum)
      end

      it "should return the total revenue from all the products for the vendor" do
        #in cents
        some_vendor.revenue.must_equal(4589)
      end
    end
  end
end
