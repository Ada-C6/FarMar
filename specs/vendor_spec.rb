# September 8th, 2016
# vendor_spec.rb
# Minitest for vendor.rb

require_relative 'spec_helper'
require_relative '../lib/vendor'

describe 'Testing FarMar vendor.rb' do

  before do
    @allfile = FarMar::Vendor.all
  end

  let(:vendor1) { FarMar::Vendor.new(["5", "Reynolds, Schmitt and Klocko", "3", "1"]) }
  let(:vendor2) { FarMar::Vendor.new(["12", "Windler Inc", "4", "3"]) }

  it "Test to see if vendor.rb reads in the file and creates and array of instances in self.all method" do
    expect(@allfile[6].vendor_id).must_equal("7")
    expect(@allfile[6].name).must_equal("Bechtelar Inc")
    expect(@allfile[6].num_of_employees).must_equal("4")
    expect(@allfile[6].market_id).must_equal("2")
  end

  it "Test to see if vendor.rb reads in the file and creates and an instance in self.find method with matching vendor_id" do
    expect(FarMar::Vendor.find("8").name).must_equal("Stamm Inc")
    expect(FarMar::Vendor.find("15").name).must_equal("Hyatt-King")
    expect(FarMar::Vendor.find("16").num_of_employees).must_equal("4")
  end

  it "Test to see if vendor.rb returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field - market method" do
    expect(vendor1.market.name).must_equal("People's Co-op Farmers Market")
    expect(vendor2.market.name).must_equal("Dolgeville Farmer's Market")
  end

  it "Test to see if vendor.rb returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field. - products method" do
    expect(vendor1.products[0].name).must_equal("Shaky Honey")
    expect(vendor1.products[0].product_id).must_equal("8")
    expect(vendor2.products[0].name).must_equal("Tired Bread")
  end

  it "Test to see if vendor.rb returns a collection of FarMar::Sale instances that are associated by the vendor_id field - sale method" do
    expect(vendor1.sale[0].amount).must_equal("7180")
    expect(vendor1.sale[0].sale_id).must_equal("22")
    expect(vendor2.sale[-1].amount).must_equal("295")
  end

  it "Test to see if vendor.rb returns the the sum of all of the vendor's sales (in cents) - revenue method" do
    expect(vendor1.revenue).must_equal(61749)
    expect(vendor2.revenue).must_equal(10969)
  end

  it "Test to see if vendor.rb returns all of the vendors with the given market_id - self.by_market method" do
    expect(FarMar::Vendor.by_market("6")[0].name).must_equal("Labadie-Tremblay")
    expect(FarMar::Vendor.by_market("11")[-1].name).must_equal("Shields Inc")
  end

end
