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
      self.all.find do |product|
        product.id == num
      end
    end

    def self.by_vendor(vendor_id)

      products = []
      CSV.open('./support/vendors.csv', 'r').each do |line|

        if line[3].to_i == vendor_id
          products << FarMar::Product.new(id:line[0],
          name:line[1],
          vendor_id:line[2])
        end

      end
      return products
    end

    def vendor
      FarMar::Vendor.find(@vendor_id)
    end

  end
end
