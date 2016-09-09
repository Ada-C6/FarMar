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
      test_sale = Sales.new("100","4573","2013-11-08 15:18:32 -0800","19","56")
      test_sale.product.name.must_equal("Nom nom Beef")
      end
    end

    describe "find" do
      it "3 should find an instance of Sales by its sales_id" do
      #("100","4573","2013-11-08 15:18:32 -0800","19","56")
      Sales.find("100").datetime.must_equal("2013-11-08 15:18:32 -0800")
      end
    end

    describe "self.between" do
      it "should return all sales between arguments" do
        Sales.between("11", "12").must_be_nil
      end
    end
end
