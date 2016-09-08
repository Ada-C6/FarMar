require 'csv'

module FarMar
  class Product
    attr_reader :product_id, :product_name, :vendor_id
    def initialize(product_id, product_name, vendor_id)
      # ID - (Fixnum) uniquely identifies the product
      @product_id = product_id
      # Name - (String) the name of the product (not guaranteed unique)
      @product_name = product_name
      # Vendor_id - (Fixnum) a reference to which vendor sells this product
      @vendor_id = vendor_id
    end

    def self.all
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      products = {}

      CSV.read("support/products.csv").each do |line|
        product_id, product_name, vendor_id = line # parallel assignment!
        product_id = product_id.to_i # need product_id to be a fixnum
        vendor_id = vendor_id.to_i #want vendor_id to be a fixnum

        products[product_id] = self.new(product_id, product_name, vendor_id)
      end

      return products
    end

    def self.find(id)
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      specific_product = Product.all
      return specific_product[id]
    end

    def vendor
      #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field - this will work LIKE the vendor.market method.
      Vendor.find(@vendor_id)
    end

    def self.by_vendor(vendor_id)
      # self.by_vendor(vendor_id): returns all of the products with the given vendor_id (will call this in the Vendor #products method. )
      all.values.group_by { |product| product.vendor_id }[vendor_id]
      #I don't like that these things are called the same thing -- I have an instance variable @vendor_id for a product instance, and the argument vendor_id that is getting passed in. Seems to be working though.
    end

    def sales
      #sales: returns an array of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
      Sale.all.values.group_by {|sale| sale.product_id}[@product_id]
      #NOTE: Is it possible that a given product has NO sales? Seems like yes.
    end
  end
end


#number_of_sales: returns the number of times this product has been sold.
