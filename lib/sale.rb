class FarMar::Sale
    attr_reader :id, :amount, :vendor_id, :product_id, :purchase_time
    
    def initialize(sale_hash)
        @id = sale_hash[:id]
        @amount = sale_hash[:amount]
        @vendor_id = sale_hash[:vendor_id]
        @product_id = sale_hash[:product_id]
        @purchase_time = sale_hash[:purchase_time]
    end
end
