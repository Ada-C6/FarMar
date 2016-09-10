# September 7th, 2016
#product.rb
#This program reads a product file and returns the instances within the file.
#This program also returns the top n product instances ranked by total revenue

require 'csv'
require_relative '../far_mar'
require_relative './file'
require_relative './vendor'
require_relative './market'
require_relative './sale'


class FarMar::Product < FarMar::ReadingFile
  attr_reader :product_id, :name, :vendor_id

  FILENAME = "./support/products.csv"

  def initialize(info)
    @product_id = info[0]
    @name = info[1]
    @vendor_id = info[2]
  end

# returns a collection of instances - inherit from parent class FarMar::ReadingFile
  def self.all
    return import_all_file(FILENAME).map {|row| self.new(row)}
  end


#returns an instance of the object - inherit from parent class FarMar::ReadingFile
  def self.find(prod_id)
    return self.new(find_instance(FILENAME, prod_id))
  end

#returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
  def vendor
    return array_of_instances(FarMar::Vendor.all, "vendor_id", vendor_id).first
  end

# returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  def sales
    return array_of_instances(FarMar::Sale.all, "product_id", product_id)
  end

# returns the number of times this product has been sold.
  def number_of_sales
    product_array = array_of_instances(FarMar::Sale.all, "product_id", product_id)

    return product_array.length
  end

# returns all of the products with the given vendor_id
  def self.by_vendor(ven_id)
    return_array = []

    FarMar::Product.all.each do |product|
      if product.vendor_id == ven_id.to_s
        return_array << product
      end
    end

    return return_array
  end

#returns the top n product instances ranked by total revenue
  def self.most_revenue(n)
    return_array = []

    #group_by (product_id) method returns a hash with product_id keys and an array of sale instances values
    sorted_sales_hash = FarMar::Sale.all.group_by {|obj| obj.product_id}

    sorted_sales_hash.each do |prod_id, products|
      sum = 0
      products.each do |prod|
        sum += prod.amount.to_i
      end

      #sorted_sales_hash contains product_id keys and the revenue sum as the values
      sorted_sales_hash[prod_id] = sum
    end

    #sort_by method returns an array of arrays with the first element as the keys and the second element as the value in the hash.
    #descending_array ([[product_id, sum], [product_id, sum], etc.]) contains the product_id and the revenue sum in descending order
    descending_array = sorted_sales_hash.sort_by {|id, sum| sum}.reverse

    #descending_array[i][0] returns the product_id
    n.times do |i|
      return_array << self.find(descending_array[i][0])
    end

    return return_array
  end
end


############### TESTING ###############
# puts FarMar::Product.most_revenue(2)[0].name
# puts FarMar::Product.most_revenue(2)[1].name
# puts FarMar::Product.by_vendor(2)
