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
      # ^^ I want this to work but I can't seem to find what's going wrong with the process.
    end
    return products
  end

  def self.find(id)
    return all[id]
  end

  def vendor
    Vendor.find(@vendor_id)
  end

  def sales
    return Sale.all.values.find_all { |n| n.product_id == @id }
  end

  def number_of_sales
    sale_instances = Sale.all.values.find_all { |n| n.product_id == @id }

    return sale_instances.length
  end

  def self.by_vendor(vendor_id)
    product_list = []
    product_list << all.values.find_all { |n| n.vendor_id == vendor_id }

    return product_list.flatten
  end

end
