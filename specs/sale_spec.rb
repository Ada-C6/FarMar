require_relative 'spec_helper'
require 'date'

describe FarMar::Sale do
  describe "#initialize" do
    my_hash = {id: 37,
      amount: 100,
      purchase_time: DateTime.new(2016, 2,2,2,2,2),
      vendor_id: 15,
      product_id: 12,
      }
    let (:my_sale) {FarMar::Sale.new(my_hash)}

    it "must create a Sale object" do
      my_sale.must_be_instance_of(FarMar::Sale)
    end

    it "has a purchase time" do
      my_sale.purchase_time.must_be_instance_of DateTime
    end

  end

  describe "self.all" do
    it "must return an array" do
      FarMar::Sale.all.must_be_instance_of(Array)
    end

    it "has a Sale as its first element" do
      FarMar::Sale.all[0].must_be_instance_of(FarMar::Sale)
    end

    it "turns the time into DateTime object" do
      FarMar::Sale.all[2].purchase_time.must_be_instance_of DateTime
    end

  end

  describe "self.find" do
    it "returns a Sale instance" do
      FarMar::Sale.find(14).must_be_instance_of(FarMar::Sale)
    end
  end

  describe "#vendor" do
    new_sale = FarMar::Sale.new({vendor_id: 4})
    it "returns the vendor given by sale's vendor id" do
      new_sale.vendor.id.must_equal 4
      new_sale.vendor.must_be_instance_of FarMar::Vendor

    end
  end

  describe "#product" do
    new_sale = FarMar::Sale.new({product_id: 4})
    it "returns the product given by sale's product id" do
      new_sale.product.id.must_equal 4
      new_sale.product.must_be_instance_of FarMar::Product
    end


  end
end
