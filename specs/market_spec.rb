require_relative 'spec_helper'
module FarMar
  describe Market do
    describe "#initialize" do
      my_hash = {
        id:  112,
        name: "Ada",
        address: "213 fire lane",
        city: "jacksonville",
        county: "duval",
        state: "FL",
        zip: "23454"
      }
      let(:market) { Market.new(my_hash) }

      it "should create an instance of Market" do
        market.must_be_instance_of(Market)
      end
    end

    describe "self.all" do
      let(:markets) { Market.all }
      it "should create an array of instances of markets through the CSV file" do

       Market.all.must_be_kind_of(Array)
      end

    end
  end
end
