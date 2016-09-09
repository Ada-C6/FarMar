# September 8th, 2016
# sale_spec.rb
# Minitest for sale.rb

require_relative 'spec_helper'
require_relative '../lib/sale'

describe 'Testing FarMar sale.rb' do

  before do
    @allfile = FarMar::Sale.all
  end

  let(:sale1) { FarMar::Sale.new(["10", "5160", "2013-11-08 04:31:41 -0800", "3", "4"]) }
  let(:sale2) { FarMar::Sale.new(["128", "1143", "2013-11-06 08:40:22 -0800", "25", "74"]) }

  let(:beginning_time) {DateTime.parse("2013-11-06 08:38:38 -0800")}
  let(:end_time) {DateTime.parse("2013-11-06 08:43:15 -0800")}

  it "Test to see if product.rb reads in the file and creates and array of instances in self.all method" do
    expect(@allfile[6].sale_id).must_equal("7")
    expect(@allfile[6].amount).must_equal("4095")
    expect(@allfile[6].purchase_time).must_equal(DateTime.parse("2013-11-12 14:38:29 -0800"))
    expect(@allfile[6].vendor_id).must_equal("1")
    expect(@allfile[6].product_id).must_equal("1")
  end

  it "Test to see if product.rb reads in the file and creates and an instance in self.find method with matching product_id" do
    expect(FarMar::Sale.find("9").amount).must_equal("9128")
    expect(FarMar::Sale.find("15").purchase_time).must_equal(DateTime.parse("2013-11-10 11:31:16 -0800"))
    expect(FarMar::Sale.find("16").vendor_id).must_equal("3")
    expect(FarMar::Sale.find("16").product_id).must_equal("4")
  end

  it "Test to see if product.rb returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field - vendor method" do
    expect(sale1.vendor[0].name).must_equal("Breitenberg Inc")
    expect(sale2.vendor[0].name).must_equal("Veum, Dickinson and Conroy")
  end

  it "Test to see if product.rb returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field - product method" do
    expect(sale1.product[0].name).must_equal("Yummy Fruit")
    expect(sale2.product[0].name).must_equal("Amused Beets")
  end

  it "Test to see if product.rb returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments - self.between method" do
    expect(FarMar::Sale.between(beginning_time, end_time).length).must_equal(7)
    expect(FarMar::Sale.between(beginning_time, end_time)[0].sale_id).must_equal("128")
  end
end
