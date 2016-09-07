require_relative 'spec_helper'
module FarMar

  describe Vendor do
    describe "#initialize" do
      let(:vendor) { Vendor.new(:id, :name, :number_of_employees, :market_id) }
      it "can create an instance of Vendor" do
        vendor.must_be_instance_of(Vendor)
      end
      # test below passed once there was attr_readers, instance variables not needed
      it "must respond to (have parameters of) of vendor information" do
        vendor.must_respond_to(:id)
        vendor.must_respond_to(:name)
        vendor.must_respond_to(:number_of_employees)
        vendor.must_respond_to(:market_id)
      end
    end

    describe "#self.all" do

      it "should return a hash" do
        Vendor.all.must_be_instance_of(Hash)
      end
      it "should be a collection of Vendor objects" do
        Vendor.all.each do |vendor_id, vendor|
          vendor_id.must_equal(vendor.id)
          vendor.must_be_instance_of(Vendor)
        end
      end
      it "should return information about vendors" do
        # first listed vendor
        Vendor.all[1].id.must_equal(1)
        Vendor.all[1].name.must_equal("Feil-Farrell")
        Vendor.all[1].number_of_employees.must_equal(8)
        Vendor.all[1].market_id.must_equal(1)

        # last listed vendor
        Vendor.all[2690].id.must_equal(2690)
        Vendor.all[2690].name.must_equal("Mann-Lueilwitz")
        Vendor.all[2690].number_of_employees.must_equal(4)
        Vendor.all[2690].market_id.must_equal(500)
      end
    end #self.all
    describe "#self.find(id)" do
      it "should return an instance of a Vendor object of a certain id" do
        random_vendor_id = rand(1..2690)
        Vendor.find(random_vendor_id).must_be_instance_of(Vendor)
        Vendor.find(random_vendor_id).id.must_equal(random_vendor_id)
      end
    end #self.find(id)


  end
end
