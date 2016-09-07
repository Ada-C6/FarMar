require 'CSV'

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(products_hash)
      @id = products_hash[:id]
      @name = products_hash[:name]
      @vendor_id = products_hash[:vendor_id]

    end
  end
end
