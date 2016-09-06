# lib/farmar_sale.rb
# require_relative '../far_mar'

class FarMar::Sale
  attr_reader :id
  def initialize(id, amount, purchase_time, vendor_id, product_id)
    @id = id
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  # load sale infomation from sale csv file
  # input: csv file name (optional)
  # output: an array of class sale objects
  def self.all
    sale_csv_file = "/Users/mengyao/ADA_class/FarMar/support/sales.csv"

    sales = []
    CSV.foreach(sale_csv_file) do |row|
      id = row[0].to_s
      amount = row[1].to_s
      purchase_time =row[2].to_s
      vendor_id = row[3].to_s
      product_id = row[4].to_s

      sales << FarMar::Sale.new(id, amount, purchase_time, sale_id, product_id)
    end
    return sales
  end

  # identify sale information by sale id
  # input: sale id (string)
  # output: an sale object that corresponds to the given sale id
  def self.find(id)
    found_sale = nil
    all.each do |sale|
      if id == sale.id
        found_sale = sale
        break
      end
    end
    return found_vendor
  end
end
