class FarMar::Product
    attr_reader :id, :name, :vendor_id
    
    def initialize(product_hash)
        @id = product_hash[:id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
    end
end
