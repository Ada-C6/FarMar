require 'csv'

class FarMar::Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
        @id = id # (Fixnum) uniquely identifies the sale
        @amount = amount # (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
        @purchase_time = purchase_time # (Datetime) when the sale was completed
        @vendor_id = vendor_id # (Fixnum) a reference to which vendor completed the sale
        @product_id = product_id # (Fixnum) a reference to which product was sold
    end

end
