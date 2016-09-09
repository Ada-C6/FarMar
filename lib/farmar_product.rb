# lib/farmar_product.rb
# require_relative '../far_mar'

class FarMar::Product
  attr_reader :id, :vendor_id
  def initialize(id, name, vendor_id)
    @id = id
    @name =name
    @vendor_id = vendor_id
  end

  # load product infomation from product csv file
  # input: csv file name (optional)
  # output: an array of class product objects
  def self.all
    if @products != nil
      return @products
    end

    product_csv_file = "/Users/mengyao/ADA_class/FarMar/support/products.csv"

    products = []
    CSV.foreach(product_csv_file) do |row|
      id = row[0].to_s
      name = row[1].to_s
      vendor_id =row[2].to_s

      products << FarMar::Product.new(id, name, vendor_id)
    end

    @products = products
    return @products
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

  # returns all of the FarMar::Product objects with the given vendor_id
  def self.by_vendor(vendor_id)
    return self.all.select {|product| product.vendor_id == vendor_id }
  end

  # returns the top n product instances ranked by total revenue
  def self.most_revenue(n)
    # get an array of Product objects sorted by revenue in descending order
    products_by_revenue = FarMar::Product.all.sort_by {|product| product.vendor.revenue}.reverse
    # get the top n Vendor objecthighest revenue
    return products_by_revenue.slice(0...n)

  end

  # returns an array of FarMar::Vendor objects that is associated with Product's vendor_id
  def vendor
    return FarMar::Vendor.find(@vendor_id)
  end

  # return an array of FarMar::Sale objects that are associated with the product_id
  def sales
    return FarMar::Sale.find_by_product_id(@id)
  end

  # returns the number of times this product has been sold(fixnum)
  def number_of_sales
    # means return the size of array of Sale objects with the same product_id
    return self.sales.size
  end


end
