# September 8th, 2016
# product_spec.rb
# Minitest for product.rb

require_relative 'spec_helper'
require_relative '../lib/product'

describe 'Testing FarMar product.rb' do

  before do
    @allfile = FarMar::Product.all
  end

  let(:product1) { FarMar::Product.new(["6", "Smooth Mushrooms", "4"]) }
  let(:product2) { FarMar::Product.new(["10", "Black Apples", "5"]) }

  it "Test to see if product.rb reads in the file and creates and array of instances in self.all method" do
    expect(@allfile[6].product_id).must_equal("7")
    expect(@allfile[6].name).must_equal("Quaint Beef")
    expect(@allfile[6].vendor_id).must_equal("4")
  end

  it "Test to see if product.rb reads in the file and creates and an instance in self.find method with matching product_id" do
    expect(FarMar::Product.find("9").name).must_equal("Large Mushrooms")
    expect(FarMar::Product.find("15").name).must_equal("Comfortable Pretzel")
    expect(FarMar::Product.find("16").vendor_id).must_equal("8")
  end

  it "Test to see if product.rb returns the top n product instances ranked by total revenue - self.most_revenue(n)" do
    expect(FarMar::Product.most_revenue(3).class).must_equal(Array)
    expect(FarMar::Product.most_revenue(3).length).must_equal(3)
    expect(FarMar::Product.most_revenue(3)[0].product_id).must_equal("7848")
  end
end
