# lib/farmar_market.rb
require 'csv'
require 'date'
require 'time'

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
  end

  def vendor
    Vendor.find(@vendor_id)
  end

  def product
    Product.find(@product_id)
  end

  def self.between(beginning_time, end_time)

    d1 = DateTime.parse(beginning_time)
    d2 = DateTime.parse(end_time)
    all_times = []
    all.each do |sale|
      q = DateTime.parse(sale.purchase_time)
      if q >= d1 && q <= d2
        all_times << sale
      end
    end
    return all_times
  end
end
