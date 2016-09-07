# lib/farmar_sale.rb
# require_relative '../far_mar'

class FarMar::Sale
  attr_reader :id, :vendor_id, :amount, :product_id, :purchase_time
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
      amount = row[1].to_f
      purchase_time =row[2].to_s
      vendor_id = row[3].to_s
      product_id = row[4].to_s

      sales << FarMar::Sale.new(id, amount, purchase_time, vendor_id, product_id)
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
    return found_sale
  end

  # returns an array of FarMar::Sale objects where the purchase time is between the two times given as arguments
  # Assume beginning_time and end_time are in String data type
  def self.between(beginning_time, end_time)
    FarMar::Sale.all.select do |sale|
      # covert purchase_time from string to object
      purchase_time_object = Time.new(sale.purchase_time)
      purchase_time_object >= Time.new(beginning_time) && purchase_time_object <= Time.new(end_time)
    end
  end

  # returns an array of FarMar::Vendor objects that is associated with Sale's vendor_id
  def vendor
    return FarMar::Vendor.all.select { |vendor| vendor.id == @vendor_id }
  end

  # returns an array of FarMar::Product objects that is associated with Sale's product_id
  def product
    return FarMar::Product.all.select { |product| product.id == @product_id }
  end



end
