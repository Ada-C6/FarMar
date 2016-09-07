# require 'CSV'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id,
    :market_id

    def initialize(sales_hash)
      @id = sales_hash[:id]
      @amount = sales_hash[:amount]
      @purchase_time = sales_hash[:purchase_time]
      @vendor_id = sales_hash[:vendor_id]
      @market_id = sales_hash[:market_id]

    end
  end
end
