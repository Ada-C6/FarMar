require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Market do
    #This allows us to just use a single instance ("magnolia") as a new Market throughout the tests.
      describe "#initialize" do

        it "1 should create return instances of self" do
          ballard = Market.new("85636", "Ballard", "737 Olive Way", "Seattle", "King", "WA", "98101")
          magnolia = Market.new("1352", "Magnolia", "3510 W Commodore Way", "Seattle", "King", "WA", "98199")
          ballard.must_be_instance_of(Market)
          magnolia.must_be_instance_of(Market)
        end

        it "2 should reflect instance variables" do
          magnolia = Market.new("11", "Magnolia", "3510 W Commodore Way", "Seattle", "King", "WA", "98199")
          magnolia.id.must_equal "11"
        end

        it "3 should return instance variables" do
          ballard = Market.new("85636", "Ballard", "737 Olive Way", "Seattle", "King", "WA", "98101")
          ballard.name.must_equal("Ballard")
        end

        it "4 should raise an error when entry invalid" do
          magnolia = Market.new("1352", "Magnolia", "3510 W Commodore Way", "Seattle", "King", "WA", "98199")
          #I want to check that if we pass something that isn't a string in, that it doesn't try to score it.
          proc {magnolia.name(21)}.must_raise(ArgumentError)
        end

        it "5 should raise Argument Errors when needed" do
          proc{ Market.new("Magnolia", "3510 W Commodore Way", "Seattle", "King", "WA", "98199") }.must_raise(ArgumentError)
        end
      end


        it "6 should return a hash of objects" do
          Market.all.must_be_kind_of(Hash)
        end

        it "7 should return all objects of self" do
          Market.all.length.must_equal 500
        end
      end

        describe "8 Market.find" do

        it "9 should return object with self id" do
          id = "1"
          Market.find(id).name.must_equal("People's Co-op Farmers Market")
        end
        it "10 should return a hash of Market(id)" do
          Market.find("333").must_be_kind_of(FarMar::Market)
        end
        it "11 should raise error if the id is invalid" do
        Market.find(891).must_be_nil
        end

        describe "12 Vendor" do

        it "13 should return a hash of instances of Vendors associated with each market" do
          Market.find("333").vendors.must_be_kind_of(Hash)
        end
        end
    end
end
