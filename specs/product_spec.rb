require_relative 'spec_helper' #get all the stuff we need for testing.

module FarMar
  describe Product do
    let(:pro_deal) {Product.new(1, "product", 123)}
    let(:carrot) {Product.new(41,"Thundering Carrots",15)}

    describe "#initialize" do
      it "should make a new instance of product" do
        #write test to check that a new product instance was created.
        pro_deal.must_be_instance_of(Product)
        # ID - (Fixnum) uniquely identifies the product
        # Name - (String) the name of the product (not guaranteed unique)
        # Vendor_id - (Fixnum) a reference to which vendor sells this product
      end
      it "should respond to .product_name" do
        pro_deal.product_name.must_equal("product")
      end
    end
    describe "self.all" do
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      it "should return a collection of products" do
        #return a collection of products
        Product.all.must_be_instance_of(Hash)
      end

      it "should be a hash of Products" do
        Product.all[12].must_be_instance_of(Product)
      end
    end
    describe "self.find(id)" do
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      it "should return a Product object when given an id" do
        Product.find(12).must_be_instance_of(Product)
      end

      it "should return the correct Product object when given an id" do
        Product.find(15).product_name.must_equal("Comfortable Pretzel")
        # 15,Comfortable Pretzel,8
      end
    end
    describe "#vendor" do
      #vendor: returns the FarMar::Vendor instance that is associated with this product using the FarMar::Product vendor_id field - this will work LIKE the vendor.market method.
      # 41,Thundering Carrots,15
      it "should return the vendor that is associated with the vendor_id" do
        carrot.vendor.id.must_equal(15)
      end
      it "should return a Vendor object" do
        carrot.vendor.must_be_instance_of(Vendor)
      end
    end
    describe "self.by_vendor(vendor_id)" do
      # self.by_vendor(vendor_id): returns all of the products with the given vendor_id (will call this in the Vendor #products method. )
      # This is similar to self.by_market method in vendor.
      it "should return an array" do
        Product.by_vendor(1).must_be_instance_of(Array)
      end

      it "should be an array of Products" do
        Product.by_vendor(1)[0].must_be_instance_of(Product)
      end
    end
    describe "#sales" do
      #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
      it "should return an Array" do
        # going to collect sales (using Sale.all), group by sale.product_id, grab only the array from this instance's product_id.
        carrot.sales.must_be_instance_of(Array)
      end
      it "should return an array of Sales" do
        carrot.sales[0].must_be_instance_of(Sale)
      end
      it "should return sales whose product_id is the same as this product_id" do
        carrot.sales[0].product_id.must_equal(carrot.product_id)
      end
    end
  end
end
