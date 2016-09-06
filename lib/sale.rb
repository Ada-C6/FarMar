# lib/farmar_market.rb
require 'csv'

class Sale
attr_reader :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id

  def initialize(sale)
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
end
