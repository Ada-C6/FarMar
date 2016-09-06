# lib/farmar_product.rb
# require_relative '../far_mar'

class FarMar::Product
  attr_reader :id
  def initialize(id, name, vendor_id)
    @id = id
    @name =name
    @pvendor_id = vendor_id
  end

  # load product infomation from product csv file
  # input: csv file name (optional)
  # output: an array of class product objects
  def self.all
    product_csv_file = "/Users/mengyao/ADA_class/FarMar/support/products.csv"

    products = []
    CSV.foreach(product_csv_file) do |row|
      id = row[0].to_s
      name = row[1].to_s
      vendor_id =row[2].to_s

      products << FarMar::Product.new(id, name, vendor_id)
    end
    return products
  end

  # identify product information by product id
  # input: product id (string)
  # output: an product object that corresponds to the given product id
  def self.find(id)
    found_product = nil
    all.each do |product|
      if id == product.id
        found_product = product
        break
      end
    end
    return found_product
  end
end
