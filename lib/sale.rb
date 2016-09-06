require 'csv'
#require_relative 'vendor'
#require_relative 'product'

module FarMar
  class Sale
    attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
    attr_accessor
    attr_writer

    def initialize(sale_hash)
      @sale_id = sale_hash["sale_id"]
      @amount = sale_hash["amount"]
      @purchase_time = sale_hash["purchase_time"]
      @vendor_id = sale_hash["vendor_id"]
      @product_id = sale_hash["product_id"]
    end

    def self.all
      sales = []
      CSV.read("./support/sales.csv").each do |line|
        sale_hash = {}
        sale_hash["sale_id"] = line[0].to_i
        sale_hash["amount"] = line[1].to_i
        sale_hash["purchase_time"] = line[2]
        sale_hash["vendor_id"] = line[3].to_i
        sale_hash["product_id"] = line[4].to_i
        sales << FarMar::Sale.new(sale_hash)
      end
      return sales
    end

    def self.find(input)
      sales = self.all
      sales.each do |var|
        if var.sale_id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Sale ID #{ @sale_id }, purchased at #{ @purchase_time }, refers to Product ID #{ @product_id }, costs #{ @amount } and is sold by Vendor ID #{ @vendor_id }."
    end


  end
end
