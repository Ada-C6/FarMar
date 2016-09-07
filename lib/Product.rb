require 'CSV'

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(products_hash)
      @id = products_hash[:id]
      @name = products_hash[:name]
      @vendor_id = products_hash[:vendor_id]

    end


    def self.all
      products = []
      CSV.read("./support/products.csv").each do |line|
        products_hash = {}
        products_hash[:id] = line[0].to_i
        products_hash[:name] = line[1]
        products_hash[:vendor_id] = line[2].to_i
        products << FarMar::Product.new(products_hash)
      end
      return products
    end


  end #end class
end #end module
