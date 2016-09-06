require 'csv'

class FarMar::Vendor
    attr_reader :id, :name, :num_of_employees, :market_id

    def initialize(id, name, num_of_employees, market_id)
        @id = id # (Fixnum) uniquely identifies the vendor
        @name = name # (String) the name of the vendor (not guaranteed unique)
        @num_of_employees = num_of_employees # (Fixnum) How many employees the vendor has at the market
        @market_id = market_id # (Fixnum) a reference to which market the vendor attends
    end

end
