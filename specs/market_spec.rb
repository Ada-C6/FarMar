require_relative 'spec_helper'
module FarMar
  describe Market do

    describe "#initialize" do

      let(:market) { Market.new(112, "ada", "213d", "jax","duval", "Fl", 23332) }

      it "should create an instance of Market" do
        market.must_be_instance_of(Market)
      end
    end

    describe "self.all" do
      let(:markets) { Market.all }
      it "should create an array of instances of markets through the CSV file" do

       Market.all.must_be_kind_of(Hash)
      end

    describe "self.find(id)" do
      let(:markets) { Market.find(8) }
      it "should return an instance of a specific market from the CSV file when you pass its id" do

      a = Market.find(8)
      # a.name.must_equal("Charlestown Farmers Market")
      a.id.must_equal(8)
      end
    end #end self.find method

     describe "#vendors" do
      it "should return a collection of vendors with the same market id" do
       foots_market = FarMar::Market.find(20)
       foots_market.vendors.length.must_equal(7)

      end
     end

    end
  end
end
