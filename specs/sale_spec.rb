require_relative 'spec_helper'

module FarMar
  describe Sale do
    describe "#initialize" do
      it "should make a new instance of sale" do
        #write something here to test new instance of sale
        Sale.new(1, "product name", 1).must_be_instance_of(Sale)
        # ID - (Fixnum) uniquely identifies the product (product id?)
        # Name - (String) the name of the product (not guaranteed unique)
        # Vendor_id - (Fixnum) a reference to which vendor sells this product
      end
    end
    # self.all: returns a collection of instances, representing all of the objects described in the CSV
    # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end
end
