# require 'csv'
# require_relative 'vendor'
# require_relative 'sale'
module FarMar
  class Product

    attr_reader :id, :name, :vendor_id, :vendor_info, :sale_info

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
      @vendor_info = []
      @sale_info = []
    end

    def self.all
      info = {}
      CSV.read('support/products.csv').each do |line|
      # CSV.read('../support/products.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        vendor_id = line[2].to_i
        info[id] = self.new(id, name, vendor_id)
      end
      return info
    end

    def self.find(id)
      self.all[id]
    end

    def vendor
      vendors = FarMar::Vendor.all
      vendors.each do |key, line|
        if @vendor_id == line.id
          @vendor_info << line
        end
      end
      return @vendor_info
    end

    def sales
      sale = FarMar::Sale.all
      sale.each do |key, line|
        if @id == line.product_id
          @sale_info << line
        end
      end
      return @sale_info
    end

    def self.by_vendor(vendor_id)
      product_info = []
      product = FarMar::Product.all
      product.each do |key, line|
        if vendor_id == line.vendor_id
          product_info << line
        end
      end
      return product_info
    end

    def number_of_sales
     total = 0
     @sale_info.each do |line|
        line
        total += 1
     end
     return total
    end
  end
end


# p = FarMar::Product.new(2, "name", 2)
# p p.sales
# p p.number_of_sales
# p p.vendor
# p FarMar::Product.by_vendor(4)
