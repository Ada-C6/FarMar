require_relative 'spec_helper'
module FarMar

  describe Sale do
    describe "#initialize" do
      let(:sale) { Sale.new(:id, :amount, :purchase_time, :vendor_id, :product_id)}
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
      # before(:each) do
      #   Sale.new(:id, :amount, :purchase_time, :vendor_id, :product_id)
      # end
      it "should return a hash" do
        Sale.all.must_be_instance_of(Hash)
      end

      # @todo this is weird and I need to think about it
      it "should be a collection of Sale objects" do
        Sale.all.each do |sale_id, sale|
          sale_id.must_equal(sale.id)
          sale.must_be_instance_of(Sale)
        end
      end
      it "should totally find a random Sale and decide it's an instance of Sale" do

        random_sale_id = rand(1..100) # 100 is an arbitrary low number
        Sale.all[random_sale_id].must_be_instance_of(Sale)
      end
    end



    # describe Vendor do
    #   describe "#self.all" do
    #
    #     it "should be a collection of Vendor objects" do
    #       Vendor.all.each do |vendor_id, vendor|
    #         vendor_id.must_equal(vendor.id)
    #         vendor.must_be_instance_of(Vendor)
    #       end
    #     end
    #     it "should return information about vendors" do
    #       # first listed vendor
    #       Vendor.all[1].id.must_equal(1)
    #       Vendor.all[1].name.must_equal("Feil-Farrell")
    #       Vendor.all[1].number_of_employees.must_equal(8)
    #       Vendor.all[1].market_id.must_equal(1)
    #
    #       # last listed vendor
    #       Vendor.all[2690].id.must_equal(2690)
    #       Vendor.all[2690].name.must_equal("Mann-Lueilwitz")
    #       Vendor.all[2690].number_of_employees.must_equal(4)
    #       Vendor.all[2690].market_id.must_equal(500)
    #     end
    #   end #self.all
    #   describe "#self.find(id)" do
    #     it "should return an instance of a Vendor object of a certain id" do
    #       random_vendor_id = rand(1..2690)
    #       Vendor.find(random_vendor_id).must_be_instance_of(Vendor)
    #       Vendor.find(random_vendor_id).id.must_equal(random_vendor_id)
    #     end
    #   end #self.find(id)






  end


end
