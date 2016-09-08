require 'csv'


module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      @id = product_hash[:id]
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id]
    end

    def self.all
      CSV.open('./support/products.csv', 'r').map do |line|
      self.new({id: line[0].to_i,
        name: line[1],
        vendor_id:line[2].to_i
        })
      end
    end

    def self.find(num)
      self.all.find {|product| product.id == num}
    end

    def self.by_vendor(vendor_id)
      self.all.select {|product| product.vendor_id == vendor_id}
    end

    def vendor
      FarMar::Vendor.find(@vendor_id)
    end

    def sales
      FarMar::Sale.all.select {|sale| sale.product_id == @id}
    end

    def number_of_sales
      sales.length
    end

  end
end
