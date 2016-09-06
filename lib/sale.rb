# require 'csv'
module FarMar
  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(sale_info)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id

    end
  end
end 
