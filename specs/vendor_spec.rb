require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Vendor do
    #This allows us to just use a single instance ("magnolia") as a new Market throughout the tests.
      describe "#initialize" do

        it "1 should return instances of self" do
          rachels = Vendor.new("market_id", "vendor_id", "name of vendor", "num_employees")
          sebastian = Vendor.new("1000", "kitty_town", "CatCafé", "N&E")
          rachels.must_be_instance_of(Vendor)
          sebastian.must_be_instance_of(Vendor)
        end

        it "2 should return instance variables" do
          downtown = Vendor.new("2234", "1123", "Emmanuel", "Natasha")
          downtown.name.must_equal("Emmanuel")
        end

        it "3 should return market_id" do
          ballard = Vendor.new("Ballard", "1123", "Emmanuel", "Natasha")
          ballard.market_id.must_equal("Ballard")
        end

        it "4 should raise an error when entry invalid" do
          magnolia = Vendor.new("1352", "Magnolia", "Gina", "Sam")
          #I want to check that if we pass something that isn't a string in, that it doesn't try to score it.
          proc {magnolia.name(nifty)}.must_raise(Exception)
        end

        it "5 should raise Argument Errors when needed" do
          proc{ Vendor.new("Magnolia") }.must_raise(ArgumentError)
        end
      end

      describe "Vendor.all" do

        it "6 should return a hash of objects" do
          Vendor.all.must_be_kind_of(Hash)
        end

        it "7 should return all objects" do
          vendor_id = ["1", "444", "10", "476", "343", "11"].sample
          Vendor.all.must_include(vendor_id)
        end

    #
    #     it "8 should return all objects of self" do
    #       Vendor
    #     end
    #   end
    end
    describe "Vendor #products" do

        it "8 should return all products by vendor_id" do
          test_vendor = Vendor.all["11"]
          test_vendor.products.must_include("29")
        end
      end

      describe "Vendor creation" do

          it "9 create simple vendor" do
            test_vendor = Vendor.new("8","11","Feil-Farrell","1")
            test_vendor.products.must_include("1")
          end
        end

      #   it "9 should return object with self id" do
      #     id = "1"
      #     Market.find(id).name.must_equal("People's Co-op Farmers Market")
      #   end
      #   it "10 should return a hash of Market(id)" do
      #     Market.find("333").must_be_kind_of(FarMar::Market)
      #   end
      #   it "11 should raise error if the id is invalid" do
      #   Market.find(891).must_be_nil
      #   end
      #
      #   describe "12 Vendor" do
      #
      #   it "13 should return a hash of instances of Vendors associated with each market" do
      #     Market.find("333").vendors.must_be_kind_of(Hash)
end
end
