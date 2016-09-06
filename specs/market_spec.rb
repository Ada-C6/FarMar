require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Market do
    let(:market_test) {Market.new(1, "name", "address", "city", "county", "ST", 98017)}
    describe "#initialize" do
      it "should make a new instance of market" do
        #this just tests the basic "I can make a new instance of this class."
        market_test.must_be_instance_of(Market)
      end
      it "should respond to .id" do
        market_test.id.must_be_instance_of(Fixnum)
      end
      it "should respond to .name" do
        market_test.name.must_be_instance_of(String)
      end
      it "should respond to .address" do
        market_test.address.must_be_instance_of(String)
      end
    end
    describe "#self.all" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV

    end
    # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end
end
