# lib/farmar_market.rb
require 'csv'

class Product
 attr_reader :id, :name, :vendor_id

  def initialize(product)
    @id = product[:id]
    @name = product[:name]
    @vendor_id = product[:vendor_id]
  end

  def self.all
    all_products = []

    CSV.read('support/products.csv').each do |line|
      product = {}
      product[:id] = line[0].to_i
      product[:name] = line[1]
      product[:vendor_id] = line[2].to_i

      all_products << self.new(product)
    end

    return all_products
  end

  def self.find(id)
    all.each do |product|
      if product.id == id
        return product
      end
    end
    # if id > 500, returns entire array....fix later
  end

end
