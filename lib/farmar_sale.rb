# lib/farmar_sale.rb
# require_relative '../far_mar'
require 'date'

class FarMar::Sale
  attr_reader :id, :vendor_id, :amount, :product_id, :purchase_time
  def initialize(id, amount, purchase_time, vendor_id, product_id)
    @id = id
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  # idempotently load data
  def self.load
    if @sales != nil
      # we have loaded this before, do not load again
      return
    end

    sale_csv_file = "/Users/mengyao/ADA_class/FarMar/support/sales.csv"

    @sales = []
    # index the sales by various IDs
    @sale_by_id = {}
    @sales_by_product_id = {}
    @sales_by_vendor_id = {}

    CSV.foreach(sale_csv_file) do |row|
      id = row[0].to_s
      amount = row[1].to_f
      purchase_time = DateTime.parse(row[2])
      vendor_id = row[3].to_s
      product_id = row[4].to_s

      new_sale = FarMar::Sale.new(id, amount, purchase_time, vendor_id, product_id)
      @sales << new_sale
      # ensure that any new product_id key starts with a [] value
      @sales_by_product_id[product_id] ||= []
      @sales_by_product_id[product_id] << new_sale
      @sale_by_id[id] = new_sale

      @sales_by_vendor_id[vendor_id] ||= []
      @sales_by_vendor_id[vendor_id] << new_sale
    end
  end


  # return an array of Sale objects
  def self.all
    load
    return @sales
  end


  # return an Sale object that corresponds to the given sale id
  def self.find(id)
    load
    return @sale_by_id[id]
  end

  # return array of Sale objects that is about the given product_id
  def self.find_by_product_id(product_id)
    load
    return @sales_by_product_id[product_id] || []
  end

  # return array of Sale objects that is about the given vendor_id
  def self.find_by_vendor_id(vendor_id)
    load
    return @sales_by_vendor_id[vendor_id] || []
  end

  # returns an array of FarMar::Sale objects where the purchase time is between the two times given as arguments
  # Assume beginning_time and end_time are in String data type
  def self.between(beginning_time, end_time)
    FarMar::Sale.all.select do |sale|
      purchase_time_object = sale.purchase_time
      purchase_time_object >= beginning_time && purchase_time_object <= end_time
    end
  end

  # returns an array of FarMar::Vendor objects that is associated with Sale's vendor_id
  def vendor
    return FarMar::Vendor.find(@vendor_id)
  end

  # returns an array of FarMar::Product objects that is associated with Sale's product_id
  def product
    return FarMar::Product.find(@product_id)
  end


end
