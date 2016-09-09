require_relative 'spec_helper'
module FarMar

  describe Sale do
    describe "#initialize" do
      let(:sale) { Sale.new(:id, 10000, :purchase_time, :vendor_id, :product_id)}
      it "can create an instance of Sale" do
        sale.must_be_instance_of(Sale)
      end
      it "must respond to vendor parameters" do
        sale.must_respond_to(:id)
        sale.must_respond_to(:amount)
        sale.must_respond_to(:purchase_time)
        sale.must_respond_to(:vendor_id)
        sale.must_respond_to(:product_id)
      end
    end

    describe "#self.all" do

      it "should return a hash" do
        Sale.all.must_be_instance_of(Hash)
      end
      it "should return information about sales" do
        # first sale in csv
        Sale.all[1].id.must_equal(1) # The sale_id hash has a key value 1, it's not an array call
        Sale.all[1].amount.must_equal(92.90)
        Sale.all[1].purchase_time.must_equal("2013-11-07 04:34:56 -0800")
        Sale.all[1].vendor_id.must_equal(1)
        Sale.all[1].product_id.must_equal(1)
        # last sale in csv
        Sale.all[12001].id.must_equal(12001)
        Sale.all[12001].amount.must_equal(89.23)
        Sale.all[12001].purchase_time.must_equal("2013-11-12 02:03:31 -0800")
        Sale.all[12001].vendor_id.must_equal(2690)
        Sale.all[12001].product_id.must_equal(8192)
      end
      # When I lost trust in my program I added these two it"shoulds"
      # -and they failed until I fixed my problem
      # @todo figure out if they are needed or if it is overcoverage

      it "should be a collection of Sale objects" do
        Sale.all.each do |sale_id, sale|
          sale_id.must_equal(sale.id)
          sale.must_be_instance_of(Sale)
        end
      end
      it "should totally find a random Sale and decide it's an instance of Sale" do

        random_sale_id = rand(1..12001)
        Sale.all[random_sale_id].must_be_instance_of(Sale)
      end
    end

    describe "#self.find(id)" do
      it "should return an instance of a Sale of a certain id" do
        random_sale_id = rand(1..12001)
        Sale.find(random_sale_id).must_be_instance_of(Sale)
        Sale.find(random_sale_id).id.must_equal(random_sale_id)
      end
    end

    #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
    describe "#vendor" do
      let(:sale_instance) { Sale.new(96,2289,"2013-11-10 17:23:48 -0800",19,57)}
      it "should return an instance of Vendor" do
        sale_instance.vendor.must_be_instance_of(Vendor)
      end
      it "should be associated with vendor_id" do
        sale_instance.vendor.id.must_equal(sale_instance.vendor_id)
      end
    end

#product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
    describe "#product" do
      let(:sale_instance) { Sale.new(96,2289,"2013-11-10 17:23:48 -0800",19,57)}
      it "should return an instance of Product" do
        sale_instance.product.must_be_instance_of(Product)
      end
      it "should be associated by the sale using the product_id field" do
        sale_instance.product.id.must_equal(sale_instance.product_id)
      end
    end

    #self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments


  end


end
