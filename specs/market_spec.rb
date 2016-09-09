require_relative 'spec_helper'


describe FarMar::Market do
  let(:cap_hill) {FarMar::Market.new( 1, "Judy", "723 Herman ave", "Skokie", "Cook", "Il", "60076")}
  describe "#initialize" do
    it "can create a new instance of Market" do
      cap_hill.must_be_instance_of(FarMar::Market)
    end

    it "should have an id property" do
      cap_hill.must_respond_to(:id)
    end

  end
  describe "self.all" do
    it "should return an array" do
      FarMar::Market.all.must_be_kind_of(Array)
    end
  end

  describe "self.find(id)" do
    it "should return the id that was passed through" do
      FarMar::Market.find(1).id.must_equal(1)
    end

    it "should return the state the corresponds to the id" do
      FarMar::Market.find(290).state.must_equal("North Carolina")
    end
  end
  describe "vendors" do
    it "should return an array" do

      cap_hill.vendors.must_be_kind_of(Array)
    end
    it "should be an instance of vendor" do
      vendor = cap_hill.vendors

      vendor[0].must_be_instance_of(FarMar::Vendor)
    end
  end
  describe "#products" do
    it "should return a collection of FarMar:: Product instances" do
      cap_hill.products.each do |x|
        x.must_be_instance_of(FarMar::Product)
      end
    end
  end

end
