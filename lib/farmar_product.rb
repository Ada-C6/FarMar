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

  end
end
