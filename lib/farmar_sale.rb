require 'csv'

module FarMar
  class Sale
    def initialize(product_id, product_name, vendor_id)
      # ID - (Fixnum) uniquely identifies the product
      # Name - (String) the name of the product (not guaranteed unique)
      # Vendor_id - (Fixnum) a reference to which vendor sells this product
    end
  end
end

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
