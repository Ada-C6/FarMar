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

  def vendor
    v = Vendor.all.find { |n| n[1].id == @vendor_id}
    return v[1]
  end

  def sales
    s = Sale.all
    sale_instances = s.find_all { |n| n[1].product_id == @id }
    return sale_instances
  end

  def number_of_sales
    s = Sale.all
    sale_instances = s.find_all { |n| n[1].product_id == @id }

    return sale_instances.length
  end

  def self.by_vendor(vendor_id)
    p = all.find_all { |n| n[1].vendor_id == vendor_id }

    product_list = []
    p.length.times do |i|
      product_list << p[i][1]
    end
    return product_list
  end

end
