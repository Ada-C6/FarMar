require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Product do
    let(:pro_deal) {Product.new(1, "product", 123)}
    describe "#initialize" do
      it "should make a new instance of product" do
        #write test to check that a new product instance was created.
        pro_deal.must_be_instance_of(Product)
        # ID - (Fixnum) uniquely identifies the product
        # Name - (String) the name of the product (not guaranteed unique)
        # Vendor_id - (Fixnum) a reference to which vendor sells this product
      end
    end
    # self.all: returns a collection of instances, representing all of the objects described in the CSV
    # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end
end
