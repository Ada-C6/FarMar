# lib/farmar_market.rb
require 'csv'

class Sale
attr_reader :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id

  def initialize(sale)
    @id = sale[:id]
    @amount_in_cents = sale[:amount_in_cents]
    @purchase_time = sale[:purchase_time]
    @vendor_id = sale[:vendor_id]
    @product_id = sale[:product_id]
  end

  def self.all
    all_sales = []

    CSV.read('support/sales.csv').each do |line|
      sale = {}
      sale[:id] = line[0].to_i
      sale[:amount_in_cents] = line[1].to_i
      sale[:purchase_time] = line[2] # Datetime, should convert?
      sale[:vendor_id] = line[3].to_i
      sale[:product_id] = line[4].to_i

      all_sales << self.new(sale)
    end

    return all_sales
  end

  def self.find(id)
    all.each do |sale|
      if sale.id == id
        return sale
      end
    end
    # if id > 500, returns entire array....fix later
  end

  def vendor
    Vendor.find(@vendor_id)
  end
end
