# lib/farmar_market.rb
require 'csv'

class Product
 attr_reader :id, :name, :vendor_id

  def initialize(product)
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

end
