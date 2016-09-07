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

    def self.all
      sales = []
      CSV.read("./support/sales.csv").each do |line|
        sales_hash = {}
        sales_hash[:id] = line[0].to_i
        sales_hash[:amount] = line[1]
        sales_hash[:purchase_time] = line[2]
        sales_hash[:vendor_id] = line[3]
        sales_hash[:market_id] = line[4]
        sales << FarMar::Sale.new(sales_hash)
      end
      return sales
    end


  end
end
