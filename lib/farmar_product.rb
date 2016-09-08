require 'csv'

class Product
  attr_reader :id, :name, :vendor_id

  def initialize(id, name, vendor_id)
    @id = id
    @name = name
    @vendor_id = vendor_id
  end

  def self.all
    products = {}
    CSV.read('support/products.csv').each do |line|
      id = line[0].to_i
      name = line[1]
      vendor_id = line[2].to_i

      products[id] = self.new(id, name, vendor_id)

      # products[line[0].to_i] = (self.new(id: line[0].to_i, name: line[1], vendor_id: line[2].to_i))
    end
    return products
  end

  def self.find(id)
    p = Product.all
    return p[id]
  end

end
