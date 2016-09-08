require 'CSV'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id,
    :market_id

    def initialize(id, amount, purchase_time, vendor_id, market_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @market_id = market_id

    end

    def self.all
      sales_hash = {}
      CSV.read("./support/sales.csv").each do |line|
        id = line[0].to_i
        amount = line[1]
        purchase_time = line[2]
        vendor_id = line[3]
        market_id = line[4]
        sales_hash[id] = self.new(id, amount, purchase_time, vendor_id, market_id)
      end
      return sales_hash
    end

    def self.find(id)

      return self.all[id]
    end
  end
end
