class FarMar::Vendors
    attr_reader :id, :name, :no_employees, :market_id

    def initialize(vendor_hash)
        @id = vendor_hash[:id]
        @name = vendor_hash[:name]
        @no_employees = vendor_hash[:no_employees]
        @market_id = vendor_hash[:market_id]
    end
end
