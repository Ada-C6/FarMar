require 'csv'
# require 'date'

module FarMar
  class Sale
    attr_reader :sale_id, :amount, :vendor_id, :product_id, :purchase_time
    def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
      # sale_id, amount, purchase_time, vendor_id, product_id)
      # ID - (Fixnum) uniquely identifies the sale
      @sale_id = sale_id
      # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
      @amount = amount
      # Purchase_time - (Datetime) when the sale was completed
      @purchase_time = DateTime.parse(purchase_time) # purchase_time in csv is the string representation of a datetime, not the comma delimited input that Datetime is expecting. https://ruby-doc.org/stdlib-2.3.1/libdoc/date/rdoc/DateTime.html#method-c-parse
      # Vendor_id - (Fixnum) a reference to which vendor completed the sale
      @vendor_id = vendor_id
      # Product_id - (Fixnum) a reference to which product was sold
      @product_id = product_id
    end

    def self.all
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      sales = {}

      CSV.read("support/sales.csv").each do |line|
        sale_id, amount, purchase_time, vendor_id, product_id = line # parallel assignment!
        sale_id = sale_id.to_i # need sale_id to be a fixnum
        amount = amount.to_i # want amount to be a fixnum also
        vendor_id = vendor_id.to_i # want vendor_id to be a fixnum
        product_id = product_id.to_i # want product_id also to be a fixnum

        sales[sale_id] = self.new(sale_id, amount, purchase_time, vendor_id, product_id)
      end

      return sales
    end

    def self.find(id)
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      #this is going to call self.all, and then find the one with key of id
      all[id]
    end

    def vendor
      #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
      Vendor.find(@vendor_id)
    end

    def product
      #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
      Product.find(@product_id)
    end
  end
end
