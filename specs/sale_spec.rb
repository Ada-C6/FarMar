module FarMar

  class Sales
    describe "vendor" do
      it "1 should return the vendor associated with the sale instance by using its @vendor_id" do
      test_sale = Sales.new("100","4573","2013-11-08 15:18:32 -0800","19","56")
      test_sale.vendor.vendor_id.must_equal("19")
      end
    end
  end

    describe "product" do
      it "2 should return the product instance of the sale" do
      test_sale = Sales.new("100",4573,"2013-11-08 15:18:32 -0800","19","56")
      test_sale.product.name.must_equal("Nom nom Beef")
      end
    end

    describe "find" do
      it "3 should find an instance of Sales by its sales_id" do
      #("100","4573","2013-11-08 15:18:32 -0800","19","56")
      Sales.find("100").transaction_total.must_be_instance_of(Fixnum)
      end
    end

    describe "self.between" do
      it "should return all sales between arguments" do
        Sales.between("2013-11-10 12:26:30 -0800","2013-11-09 13:30:15 -0800" ).must_be_instance_of(Hash)
      end
    end
end
