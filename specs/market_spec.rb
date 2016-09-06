require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Market do
    describe "#initialize" do
      it "should make a new instance of market" do
        #this just tests the basic "I can make a new instance of this class."
        Market.new(1, "name", "address", "city", "county", "ST", 98017).must_be_instance_of(Market)
      end
    end
    # self.all: returns a collection of instances, representing all of the objects described in the CSV
    # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end
end
