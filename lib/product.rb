# require 'csv'
module FarMar
  class Product

    attr_reader :id, :name, :vendor_id

    def initialize(product_info)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end
  end
end
