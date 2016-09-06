require 'csv'

class FarMar::Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
        @id = id #(Fixnum) uniquely identifies the product
        @name = name #(String) the name of the product (not guaranteed unique)
        @vendor_id = vendor_id #(Fixnum) a reference to which vendor sells this product
    end
end
