require 'csv'
require 'date'

class Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(id, amount, purchase_time, vendor_id, product_id)
    @id = id
    @amount = amount
    @purchase_time = DateTime.parse(purchase_time)
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    sale = {}
    CSV.read('support/sales.csv').each do |line|
      id = line[0].to_i
      amount = line[1].to_i
      purchase_time = line[2]
      vendor_id = line[3].to_i
      product_id = line[4].to_i

      sale[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
    end
    return sale
  end

  def self.find(id)
    sale = Sale.all
    return sale[id]
  end

  def vendor
    Vendor.find(@vendor_id)
  end

  def product
    Product.find(@product_id)
  end

  def self.between(beginning_time, end_time)
    if beginning_time.class != Date
      beginning_time = DateTime.parse(beginning_time)
      end_time = DateTime.parse(end_time)
    end

    Sale.all.values.find_all { |n| n.purchase_time.between?(beginning_time, end_time)}
  end
end
