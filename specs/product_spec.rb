require_relative 'spec_helper' #get all the stuff we need for testing.
module FarMar
  class Product

    describe "#initialize" do

      it "1 should return instances of self" do
        rachels = Product.new("id", "name", "vendor_id")
        sebastian = Product.new("1000", "kitty_town", "CatCafé")
        rachels.must_be_instance_of(Product)
        sebastian.must_be_instance_of(Product)
      end

      it "2 should return instance variables" do
        downtown = Product.new("2234", "Emmanuel", "Natasha")
        downtown.name.must_equal("Emmanuel")
      end

      it "3 should return vendor_id" do
        ballard = Product.new("Ballard", "1123", "Natasha")
        ballard.vendor_id.must_equal("Natasha")
      end

      it "4 should raise an error when entry invalid" do
        magnolia = Product.new("1352", "Gina", "Sam")
        #I want to check that if we pass something that isn't a string in, that it doesn't try to score it.
        proc {magnolia.name(nifty)}.must_raise(Exception)
      end

      it "5 should raise Argument Errors when needed" do
        proc{Product.new("Magnolia")}.must_raise(Exception)
      end
    end

    describe "Product.all" do

      it "6 should return a hash of objects" do
        Product.all.must_be_kind_of(Hash)
      end

      it "7 should return all objects" do
        vendor_id = ["1", "444", "10", "476", "343", "11"].sample
        Product.all.must_include(vendor_id)
      end
    end
  end
    describe "vendor" do
      ##16,Obedient Fish,8

      it "8 should return vendor with product id" do
        test_product = Product.new("16", "Obedient Fish", "8")
        test_product.vendor.name.must_equal("Shaky Honey")
      end

      it " 9 produces appropriate simple vendor" do
          test_product = Product.new("17","Defeated Apples","8")
          test_product.vendor.name.must_equal("Shaky Honey")
      end
    end

    describe "find" do

      it "10 should return product objects with all its vendors" do
        id = "15"
        Product.find(id).name.must_equal("Comfortable Pretzel")
      end

      it "11 should return a hash of Product(id)" do
        ##56,Nom nom Beef,19
        Product.find("56").must_be_kind_of(FarMar::Product)
       end

      it "12 should raise error if the id is invalid" do
        Product.find(891).must_be_nil
      end

      it "13 should return a hash of instances of Vendors associated with each market" do
        Product.find("333").vendor.must_be_kind_of(FarMar::Product)
      end
    end
end
