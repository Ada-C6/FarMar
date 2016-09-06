require 'csv'

class FarMar::Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
        @id = id
        @name = name
        @vendor_id = vendor_id
    end
end
