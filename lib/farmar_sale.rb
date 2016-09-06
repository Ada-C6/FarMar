require 'csv'

module FarMar
  class Sale
    def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
      # ID - (Fixnum) uniquely identifies the sale
      # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
      # Purchase_time - (Datetime) when the sale was completed
      # Vendor_id - (Fixnum) a reference to which vendor completed the sale
      # Product_id - (Fixnum) a reference to which product was sold
    end
  end
end

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
