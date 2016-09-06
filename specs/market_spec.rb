require_relative 'spec_helper' #get all the stuff we need for testing.
require_relative '../lib/farmar_market' #this is the class we're testing here.

module FarMar
  describe Market do
    describe "#initialize" do
      it "should make a new instance of market" do
        #this just tests the basic "I can make a new instance of this class."
        Market.new(1, "name", "address", "city", "county", "ST", 98017).must_be_instance_of(Market)
      end
    end
  end
end
